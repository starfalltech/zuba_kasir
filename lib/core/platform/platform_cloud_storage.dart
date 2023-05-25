import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';

class PlatformCloudStorage {
  Future<bool> addImageToServer(String path) async {
    final storageRef = FirebaseStorage.instance.ref();
    final mountainImagesRef = storageRef.child("menu-img");
    File img = File(path);

    try {
      await mountainImagesRef.putFile(img);
    } on FirebaseException catch (e) {
      throw e.toString();
    }
    return true;
  }
}
