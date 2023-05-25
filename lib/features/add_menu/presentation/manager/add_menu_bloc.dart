import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:zuba_karis/features/add_menu/domain/entities/menu_entity.dart';

import '../../../../core/exceptions/failure.dart';
import '../../domain/repositories/add_menu_repository.dart';

part 'add_menu_event.dart';

part 'add_menu_state.dart';

class AddMenuBloc extends Bloc<AddMenuEvent, AddMenuState> {
  final AddMenuRepository repository;

  AddMenuBloc({required this.repository}) : super(AddMenuInitial()) {
    on<AddMenuToServer>(addMenuEventToState);
  }

  FutureOr<void> addMenuEventToState(
      AddMenuToServer event, Emitter<AddMenuState> emit) async {
    emit(LoadingAddMenuState());
    final isSucces = await repository.addMenu(event.model);
    isSucces.fold((l) {
      if (l is ServerFailure) {
        emit(FailureAddMenuState(l.msg));
      }
    }, (r) => null);
  }
}
