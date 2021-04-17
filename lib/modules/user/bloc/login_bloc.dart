import 'dart:async';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:http/http.dart' as http;
import 'package:new_video/globals.dart' as globals;
import 'package:new_video/overrides.dart' as overrides;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dio/dio.dart';
part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial());

  bool isRegisterApiCallProcess = false;
  @override
  LoginState get initialState => LoginInitial();

  @override
  Stream<LoginState> mapEventToState(
    LoginEvent event,
  ) async* {
    if (event is LoginButtonPressed) {
      print("hello Login event function");
      try {
        yield Loading();
        final cred = LoginButtonPressed(
          username: event.username,
          password: event.password,
        );
        bool flag = await login(cred.username, cred.password);

        yield LoginSuccess();
      } catch (e) {
        yield ErrorinLogin(err: e);
      }
    }

    if (event is Registration) {
      print("Registration Event is call");
      try {
        yield Loading();
        final cred = Registration(
          username: event.username,
          email: event.email,
          password: event.password,
        );
        bool flag = await register(cred.username, cred.email, cred.password);
        print(flag);
        yield Registered();
      } catch (e) {
        yield ErrorinRegistration(err: e);
      }
    }
  }

  Future register(username, email, password) async {
    Map data = {'username': username, 'email': email, 'password': password};
    try {
      final encodedProfileData = json.encode(data);

      // try {
      //   final encodedProfileData = jsonEncode({
      //     "username": username,
      //     "email": email,
      //     "password": password,
      //   });

      final response = await http.post(Uri.parse(overrides.registerApi),
          headers: {
            'Content-Type': 'application/json',
          },
          body: encodedProfileData);

      print(response.body);

      //////////////////////////////////Code for set sate ///////////////////////
      if (response.statusCode == 200) {
        return true;
      } else {
        throw ("Something went wronge");
      }
    } catch (e) {
      print(e);

      print(e.toString().contains("Failed host lookup"));
      if (e.toString().contains("Failed host lookup")) {
        print(e);
        print("inside ifff");
        throw ("Please check your Internet Connection.");
      } else {
        throw (e);
      }
    }
  }

  Future login(email, password) async {
    try {
      FormData formData = FormData.fromMap({
        "username": email,
        "password": password,
      });

      var dio = Dio();
      Response response = await dio.post(
        "${overrides.loginapi}",
        data: formData,
        options: Options(
          headers: {
            'Accept': 'application/json',
            'Authorization': 'Bearer ${globals.token}'
          },
        ),
      );

      SharedPreferences pref = await SharedPreferences.getInstance();

      print(response.data);
      if (response.statusCode == 200) {
        final data = response.data;
        pref.setString("email", email);
        pref.setString("password", password);

        if (data.containsKey("status")) {
          print("contaim  message");

          if (data["status"] == "ok") {
            if (data.containsKey("cookie")) {
              print("got the tocken");
              print(data["cookie"]);
              globals.token = data["cookie"];
              print(data["token"]);
            }
            if (data.containsKey("cookie_name")) {
              globals.token_name = data["cookie_name"];
            }

            if (data.containsKey("user")) {
              if (data["user"] != null) {
                globals.patient = data["user"];
                return true;
              } else {
                print("contain not message");
                throw ("Something went wrong.");
              }
            }
          } else {
            if (data["error"] != null) {
              throw (data["error"] == "Unauthorised" ||
                      data["error"].toLowerCase() ==
                          "invalid email or password."
                  ? "Invalid email or password."
                  : "Invalid email or password.");
            } else {
              throw ("Something went wrong.333");
            }
          }
        }
      } else {
        if (response.data.contains("Failed host lookup")) {
          print("inside ifff");
          throw ("Failed host lookup.");
        } else {
          print("inside else");
          throw ("Please check your Internet Connection.");
        }
      }
    } catch (e) {
      print(e);

      print(e.toString().contains("Failed host lookup"));
      if (e.toString().contains("Failed host lookup")) {
        print(e);
        print("inside ifff");
        throw ("Please check your Internet Connection.");
      } else {
        throw (e);
      }
    }
  }
}
