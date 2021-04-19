part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();
}

class LoginButtonPressed extends LoginEvent {
  final String username;
  final String password;

  const LoginButtonPressed({
    @required this.username,
    @required this.password,
  });
  @override
  List<Object> get props => [username, password];

  @override
  String toString() =>
      'LoginButtonPressed { username: $username, password: $password }';
}

class Registration extends LoginEvent {
  final String email;
  final String password;
  final String username;

  const Registration({
    @required this.username,
    @required this.email,
    @required this.password,
  });
  @override
  List<Object> get props => [username, email, password];

  @override
  String toString() =>
      'registration {username:$username, email: $email, password: $password }';
}
