part of 'course_bloc.dart';

abstract class CourseState extends Equatable {
  const CourseState();
}

class CourseInitial extends CourseState {
  @override
  List<Object> get props => [];
}

class Loading extends CourseState {
  @override
  List<Object> get props => [];
}

class ErrorinloadingCoursedata extends CourseState {
  final err;
  ErrorinloadingCoursedata({this.err});
  ErrorinloadingCoursedata copyWith({var err}) {
    return ErrorinloadingCoursedata(err: err ?? this.err);
  }

  @override
  List<Object> get props => [err];
}

class FetchCourseData extends CourseState {
  List<CourseData> obj;

  FetchCourseData({this.obj});

  FetchCourseData copyWith({var obj}) {
    return FetchCourseData(obj: obj ?? this.obj);
  }

  @override
  List<Object> get props => [obj];
}
