import 'dart:async';
import 'package:new_video/modules/home/models/trainings.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../overrides.dart' as overrides;
import 'package:dio/dio.dart';
part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial());

  bool isRegisterApiCallProcess = false;
  @override
  HomeState get initialState => HomeInitial();

  @override
  Stream<HomeState> mapEventToState(
    HomeEvent event,
  ) async* {
    if (event is HomeButtonPressed) {
      print("hello evnt function");
      try {
        yield Loading();
        final cred = HomeButtonPressed();
        List<Trainings> data = await getTrainings();

        print(data);
        yield FetchTrainingData(obj: data);
      } catch (e) {
        yield Errorinloading(err: e);
      }
    }
  }

  Future getTrainings() async {
    try {
      FormData formData = FormData.fromMap({});

      var dio = Dio();
      Response response = await dio.get(
        "${overrides.homecourseApi}",
        // data: formData,
        options: Options(
          headers: {
            'Accept': 'application/json',
            // 'Authorization': 'Bearer ${globals.token}'
          },
        ),
      );

      if (response.statusCode == 200) {
        final data = response.data;
        final data2 = data as List;

        return data2.map((i) {
          return Trainings(
            i["id"],
            i["title"]["rendered"],
            i["slug"],
            i["content"]["rendered"],
          );
        }).toList();
      } else {
        // print(response.body);
        if (response.data.contains("Failed host lookup")) {
          print("inside if");
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
        print("inside if");
        throw ("Please check your Internet Connection.");
      } else {
        throw (e);
      }
    }
  }
}
