import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../../overrides.dart' as overrides;
import '../../../globals.dart' as globals;
import 'models/userdata.dart';
part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserInitial());

  @override
  UserState get initialState => UserInitial();

  @override
  Stream<UserState> mapEventToState(
    UserEvent event,
  ) async* {
    if (event is UserPageEvent) {
      print("hello event function");
      try {
        yield Loading();
        final cred = UserPageEvent();
        UserData data = await getuserdata();

        print(data);

        yield UserSuccess(obj: data);
      } catch (e) {
        yield ErrorReceivedtoUserData(err: e);
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
        "${overrides.loginapi}",
        data: formData,
        options: Options(
          headers: {
            'Accept': 'application/json',
            // 'Authorization': 'Bearer ${globals.token}'
          },
        ),
      );

      SharedPreferences pref = await SharedPreferences.getInstance();

      print(response.data);
      if (response.statusCode == 200) {
        print("response  200");
        final data = (response.data);

        print(data["user"]["avatar"].runtimeType);
        return UserData(data["user"]["email"], data["user"]["username"],
            data["user"]["avatar"]);
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
}
