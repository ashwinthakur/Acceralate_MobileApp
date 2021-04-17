// import 'package:onesignal_flutter/onesignal_flutter.dart';
//import 'package:shared_preferences/shared_preferences.dart';
import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';
//import 'package:dio/dio.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../overrides.dart' as overrides;
import '../globals.dart' as globals;
import 'models/userdata.dart';
part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  // final DbServices _dbServices = DbServices();
  //
  UserBloc() : super(UserInitial());

  bool isRegisterApiCallProcess = false;
  @override
  UserState get initialState => UserInitial();

  //LoginState get setstate => Registered1();

  // var _user = globals.patient;
  @override
  Stream<UserState> mapEventToState(
    UserEvent event,
  ) async* {
    if (event is UserButtonPressed) {
      print("hello evnt function");
      try {
        yield Loading();
        final cred = UserButtonPressed();
        UserData data = await getuserdata();

        // bool flag = await user(cred.username, cred.password);
        // if (flag) {
        //   initPlatformState();
        // }
        print(data);

        yield UserSuccess(obj: data);
      } catch (e) {
        yield ErrorReceived1(err: e);
      }
    }
  }

  Future getuserdata() async {
    var email = "demo10@gmail.com";
    var password = "Demo@101";
    try {
      FormData formData = FormData.fromMap({
        "username": email,
        "password": password,
      });

      var dio = Dio();
      Response response = await dio.post(
        "${overrides.apiURL}/api/auth/generate_auth_cookie/",
        data: formData,
        options: Options(
          headers: {
            'Accept': 'application/json',
            // 'Authorization': 'Bearer ${globals.token}'
          },
        ),
      );
      // var dio = Dio();
      SharedPreferences pref = await SharedPreferences.getInstance();
      print("%%%%%%%%%%%%%%%%%%%%% await call");
      print(response.data);
      if (response.statusCode == 200) {
        print("response  200");
        final data = (response.data);
        // final data2 = data as List;
        print(" avatar link*** " + data["user"]["avatar"]);
        print(data["user"]["avatar"].runtimeType);
        return UserData(data["user"]["email"], data["user"]["username"],
            data["user"]["avatar"]);

        // return data2.map((i) {
        //   return UserData(
        //     i["user"]["email"],
        //     i["user"]["displayname"],
        //     i["user"]["avatar"],
        //   );
        // }).toList();

      }
      if (response.data.contains("Failed host lookup")) {
        print("inside ifff");
        throw ("Failed host lookup.");
      } else {
        print("inside else");
        throw ("Please check your Internet Connection.");
      }
    } catch (e) {
      print(e);
    }
  }
  /*else {
          print("contain not message");
          if (data["error"] != null) {
            throw (data["error"] == "Unauthorised" ||
                    data["error"].toLowerCase() == "Invalid email or password."
                ? "Invalid email or password."
                : "Something went wrong.2222");
          } else {
            throw ("Something went wrong.1111");
          }
        }*/
}
