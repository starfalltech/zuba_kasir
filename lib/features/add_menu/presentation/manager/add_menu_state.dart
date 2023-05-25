part of 'add_menu_bloc.dart';

abstract class AddMenuState extends Equatable {
  const AddMenuState();
  @override
  List<Object> get props => [];
}

class AddMenuInitial extends AddMenuState {}

class LoadingAddMenuState extends AddMenuState {}

class SuccesAddMenuState extends AddMenuState {}

class FailureAddMenuState extends AddMenuState {
  final String msg;

  const FailureAddMenuState(this.msg);
}
