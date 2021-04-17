part of 'login_bloc.dart';

abstract class LoginState extends Equatable {
  const LoginState();
}

class LoginInitial extends LoginState {
  @override
  List<Object> get props => [];
}

class LoginSuccess extends LoginState {
  @override
  List<Object> get props => [];
}

class Registered extends LoginState {
  @override
  List<Object> get props => [];
}

class RegisteredSucess extends LoginState {
  @override
  List<Object> get props => [];
}

class LoginError extends LoginState {
  @override
  List<Object> get props => [];
}

class Loading extends LoginState {
  @override
  List<Object> get props => [];
}

class PasswordRestSuccess extends LoginState {
  @override
  List<Object> get props => [];
}

class Error1 extends LoginState {
  @override
  List<Object> get props => [];
}

class OnLoading extends LoginState {
  @override
  List<Object> get props => [];
}

class ErrorinRegistration extends LoginState {
  final err;
  ErrorinRegistration({this.err});
  ErrorinRegistration copyWith({var err}) {
    return ErrorinRegistration(err: err ?? this.err);
  }

  @override
  List<Object> get props => [err];
}

class ErrorinLogin extends LoginState {
  final err;
  ErrorinLogin({this.err});
  ErrorinLogin copyWith({var err}) {
    return ErrorinLogin(err: err ?? this.err);
  }

  @override
  List<Object> get props => [err];
}

class OnClickedRegistration extends LoginState {
  @override
  List<Object> get props => [];
}

class OnClickedReset extends LoginState {
  @override
  List<Object> get props => [];
}

class OnClickUpdate extends LoginState {
  @override
  List<Object> get props => [];
}
