part of 'authentication_bloc.dart';

abstract class AuthenticationState extends Equatable {

  @override
  List<Object> get props => [];
}

class InitialAuthenticationState extends AuthenticationState {}

class LoadingAuthenticationState extends AuthenticationState {}

class SuccesAuthenticationState extends AuthenticationState {}

class FailureAuthenticationState extends AuthenticationState {
  final String msg;

  FailureAuthenticationState(this.msg);
}
