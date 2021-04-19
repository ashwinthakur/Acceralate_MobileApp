import 'dart:async';
import 'package:new_video/modules/lessaons/ui/course.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:new_video/modules/lessaons/ui/models/coursedata.dart';
import '../../../overrides.dart' as overrides;
import 'package:dio/dio.dart';
part 'course_event.dart';
part 'course_state.dart';

class CourseBloc extends Bloc<CourseEvent, CourseState> {
  CourseBloc() : super(CourseInitial());

  bool isRegisterApiCallProcess = false;
  @override
  CourseState get initialState => CourseInitial();

  @override
  Stream<CourseState> mapEventToState(
    CourseEvent event,
  ) async* {
    if (event is CourseButtonPressed) {
      print("hello CourseEvent call ");
      try {
        yield Loading();
        final cred = CourseButtonPressed();
        List<CourseData> data = await getCourse();
        print(data);
        yield FetchCourseData(obj: data);
      } catch (e) {
        yield ErrorinloadingCoursedata(err: e);
      }
    }
  }

  Future getCourse() async {
    try {
      FormData formData = FormData.fromMap({});

      var dio = Dio();
      Response response = await dio.get(
        "${overrides.courseApi}",
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
          return CourseData(
            i["title"]["rendered"],
            i["content"]["rendered"],
          );
        }).toList();
      } else {
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
