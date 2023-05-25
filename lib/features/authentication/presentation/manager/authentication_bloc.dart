import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/exceptions/failure.dart';
import '../../../../core/local_storage/local_auth_storage.dart';
import '../../domain/repositories/auth_repository.dart';

part 'authentication_event.dart';

part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final AuthRepository repository;

  AuthenticationBloc({required this.repository})
      : super(InitialAuthenticationState()) {
    on<PostRegister>(registerAuth);
    on<PostLogin>(loginAuth);
    on<CheckAuth>(checkAuth);
  }

  FutureOr<void> registerAuth(
      PostRegister event, Emitter<AuthenticationState> emit) async {
    emit(LoadingAuthenticationState());
    final postRegister =
        await repository.registerAuth(event.name, event.password);
    postRegister.fold((l) {
      if (l is ServerFailure) {
        emit(FailureAuthenticationState(l.msg));
      }
    }, (r) => emit(SuccesAuthenticationState()));
  }

  FutureOr<void> loginAuth(
      PostLogin event, Emitter<AuthenticationState> emit) async {
    emit(LoadingAuthenticationState());
    final postLogin = await repository.loginAuth(event.name, event.password);
    postLogin.fold((l) {
      if (l is ServerFailure) {
        emit(FailureAuthenticationState(l.msg));
      }
      if (l is InternalFailure) {
        emit(FailureAuthenticationState(l.msg));
      }
    }, (r) => emit(SuccesAuthenticationState()));
  }

  FutureOr<void> checkAuth(
      CheckAuth event, Emitter<AuthenticationState> emit) async {
    print('this is state');
    emit(LoadingAuthenticationState());
    try {
      await LocalAuthStorage().read(event.key).then((value) async {
        await Future.delayed(const Duration(milliseconds: 2000));
        emit(
          SuccesAuthenticationState(),
        );
      });
    } catch (e) {
      await Future.delayed(const Duration(milliseconds: 2000));
      emit(
        FailureAuthenticationState(e.toString()),
      );
    }
  }
}
