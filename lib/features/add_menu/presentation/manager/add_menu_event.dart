part of 'add_menu_bloc.dart';

abstract class AddMenuEvent extends Equatable {
  const AddMenuEvent();
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class AddMenuToServer extends AddMenuEvent {
  final MenuEntity model;

  const AddMenuToServer(this.model);
}
