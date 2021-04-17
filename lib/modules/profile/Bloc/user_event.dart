part of 'user_bloc.dart';

abstract class UserEvent extends Equatable {
  const UserEvent();
}

class UserButtonPressed extends UserEvent {
  const UserButtonPressed();
  @override
  List<Object> get props => [];
}
