import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cryptography/cryptography.dart';
import 'package:zuba_karis/core/local_storage/local_auth_storage.dart';

class PlatformFirestore {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<bool> registerUser(
      {required String name, required String password}) async {
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    final algorithm = Sha256();
    return users.add({
      "name": name,
      "password": await algorithm
          .hash(utf8.encode(password))
          .then((value) => value.bytes.toString()),
    }).then((value) {
      LocalAuthStorage().write('auth', value.id);
      return true;
    }).catchError((onError) {
      throw onError.toString();
    });
  }

  Future<bool> addMenuToServer() async {
    return false;
  }
}
