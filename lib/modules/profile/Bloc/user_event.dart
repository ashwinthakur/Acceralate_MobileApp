part of 'user_bloc.dart';

abstract class UserEvent extends Equatable {
  const UserEvent();
}

class UserPageEvent extends UserEvent {
  const UserPageEvent();
  @override
  List<Object> get props => [];
}
