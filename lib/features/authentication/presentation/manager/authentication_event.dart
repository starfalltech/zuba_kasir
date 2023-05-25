part of 'authentication_bloc.dart';

abstract class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();

  // TODO: implement props
  @override
  List<Object?> get props => [];
}

class PostLogin extends AuthenticationEvent {
  final String name;
  final String password;

  const PostLogin(this.name, this.password);
}

class PostRegister extends AuthenticationEvent {
  final String name;
  final String password;

  const PostRegister(
    this.name,
    this.password,
  );
}

class CheckAuth extends AuthenticationEvent {
  final String key;

  const CheckAuth(this.key);
}
