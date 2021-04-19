part of 'user_bloc.dart';

abstract class UserState extends Equatable {
  const UserState();
}

class UserInitial extends UserState {
  @override
  List<Object> get props => [];
}

class UserSuccess extends UserState {
  UserData obj;

  UserSuccess({this.obj});

  UserSuccess copyWith({var obj}) {
    return UserSuccess(obj: obj ?? this.obj);
  }

  @override
  List<Object> get props => [];
}

class Loading extends UserState {
  @override
  List<Object> get props => [];
}

class ErrorReceivedtoUserData extends UserState {
  final err;
  ErrorReceivedtoUserData({this.err});
  ErrorReceivedtoUserData copyWith({var err}) {
    return ErrorReceivedtoUserData(err: err ?? this.err);
  }

  @override
  List<Object> get props => [err];
}
