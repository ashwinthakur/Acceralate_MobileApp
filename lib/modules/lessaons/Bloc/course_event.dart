part of 'course_bloc.dart';

abstract class CourseEvent extends Equatable {
  const CourseEvent();
}

//   Coursebutton is not available
class CoursePageEvent extends CourseEvent {
  @override
  List<Object> get props => [];

  @override
  String toString() => ' CourseButtonPressed';
}
