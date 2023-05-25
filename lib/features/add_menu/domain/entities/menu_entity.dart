import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

class MenuEntity extends Equatable {
  final String name;
  final String imgPath;
  final String imgUrl;
  final int harga;

  const MenuEntity(
      {required this.name,
      this.imgPath = '',
      required this.harga,
      required this.imgUrl});

  @override
  // TODO: implement props
  List<Object?> get props => [];

  factory MenuEntity.fromJson(Map<String, dynamic> data) => MenuEntity(
      name: data['name'], harga: data['harga'], imgUrl: data['imgUrl']);
}
