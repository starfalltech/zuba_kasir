import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zuba_karis/exceptions/failure.dart';
import 'package:zuba_karis/local_storage/local_auth_storage.dart';

import '../../domain/repositories/auth_repository.dart';

part 'authentication_event.dart';

part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final AuthRepository repository;

  AuthenticationBloc({required this.repository})
      : super(InitialAuthenticationState()) {
    on<Register>(registerAuth);
    on<Login>(loginAuth);
    on<CheckAuth>(checkAuth);
  }

  FutureOr<void> registerAuth(
      Register event, Emitter<AuthenticationState> emit) async {
    print('this is regsiter');
    emit(LoadingAuthenticationState());
    final postRegister =
        await repository.registerAuth(event.email, event.password);
    postRegister.fold((l) {
      if (l is ServerFailure) {
        emit(FailureAuthenticationState(l.msg));
      }
    }, (r) => emit(SuccesAuthenticationState()));
  }

  FutureOr<void> loginAuth(
      Login event, Emitter<AuthenticationState> emit) async {
    emit(LoadingAuthenticationState());
    final postLogin = await repository.loginAuth(event.email, event.password);
    postLogin.fold((l) {
      if (l is ServerFailure) {
        emit(FailureAuthenticationState(l.msg));
      }
      if(l is InternalFailure){
        emit(FailureAuthenticationState(l.msg));
      }
    }, (r) => emit(SuccesAuthenticationState()));
  }

  FutureOr<void> checkAuth(
      CheckAuth event, Emitter<AuthenticationState> emit) async {
    print('this is state');
    emit(LoadingAuthenticationState());
    try {
      await LocalAuthStorage().read(event.key).then((value) {
        emit(
          SuccesAuthenticationState(),
        );
      });
    } catch (e) {
      emit(
        FailureAuthenticationState(e.toString()),
      );
    }
  }
}
