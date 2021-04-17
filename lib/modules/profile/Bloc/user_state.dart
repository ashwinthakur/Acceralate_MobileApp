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

class UserError extends UserState {
  @override
  List<Object> get props => [];
}

class Loading extends UserState {
  @override
  List<Object> get props => [];
}

class OnLoading extends UserState {
  @override
  List<Object> get props => [];
}

class GetData extends UserState {
  @override
  List<Object> get props => [];
}

class InvalidCredentials extends UserState {
  @override
  List<Object> get props => [];
}

class ErrorReceived1 extends UserState {
  final err;
  ErrorReceived1({this.err});
  ErrorReceived1 copyWith({var err}) {
    return ErrorReceived1(err: err ?? this.err);
  }

  @override
  List<Object> get props => [err];
}

class UserErrorReceived1 extends UserState {
  final err;
  UserErrorReceived1({this.err});
  UserErrorReceived1 copyWith({var err}) {
    return UserErrorReceived1(err: err ?? this.err);
  }

  @override
  List<Object> get props => [err];
}
