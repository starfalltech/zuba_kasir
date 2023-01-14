part of 'authentication_bloc.dart';

abstract class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();

  // TODO: implement props
  @override
  List<Object?> get props => [];
}

class Login extends AuthenticationEvent {
  final String email;
  final String password;

  const Login(this.email, this.password);
}

class Register extends AuthenticationEvent {
  final String email;
  final String password;
  final String username;

  const Register(this.email, this.password, this.username);
}

class CheckAuth extends AuthenticationEvent {
  final String key;

  const CheckAuth(this.key);
}
