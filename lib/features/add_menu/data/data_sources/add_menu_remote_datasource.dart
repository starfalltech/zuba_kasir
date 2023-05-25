import 'package:zuba_karis/core/platform/platform_cloud_storage.dart';
import 'package:zuba_karis/features/add_menu/domain/entities/menu_entity.dart';

import '../../../../core/exceptions/exceptions.dart';
import '../../../../core/platform/platform_firestore.dart';

abstract class AddMenuRemoteDataSource {
  Future<bool> addMenu(MenuEntity model);
}

class AddMenuRemoteDataSouceImpl extends AddMenuRemoteDataSource {
  PlatformCloudStorage cloudStorage;
  PlatformFirestore firestore;
  AddMenuRemoteDataSouceImpl(this.cloudStorage, this.firestore);

  @override
  Future<bool> addMenu(MenuEntity model) async {
    try {
      return await cloudStorage
          .addImageToServer(model.imgPath)
          .then((value) async {
        if (value) {
          return await firestore.addMenuToServer().then((value) => true);
        } else {
          throw "";
        }
      });
    } catch (e, s) {
      throw ServerException(e.toString());
    }
    return true;
  }
}
