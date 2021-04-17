part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();
}

//  Homebutton is not available
class HomeButtonPressed extends HomeEvent {
  @override
  List<Object> get props => [];

  @override
  String toString() => 'HomeButtonPressed';
}
