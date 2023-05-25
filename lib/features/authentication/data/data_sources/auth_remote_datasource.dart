import 'package:firebase_auth/firebase_auth.dart';

import '../../../../core/exceptions/exceptions.dart';
import '../../../../core/platform/platform_firestore.dart';

abstract class AuthRemoteDataSource {
  Future<bool> registerAuth(String name, String password);

  Future<bool> loginAuth(String name, String password);
}

class AuthRemoteDataSourceImpl extends AuthRemoteDataSource {
  PlatformFirestore clientServices;

  AuthRemoteDataSourceImpl(this.clientServices);

  @override
  Future<bool> loginAuth(String name, String password) async {
    try {
      //final userLogin = await clientServices.(name, password);
      return true;
    } on FirebaseAuthException catch (e) {
      throw ServerException(e.code);
    }
  }

  @override
  Future<bool> registerAuth(String name, String password) async {
    try {
      return await clientServices.registerUser(name: name, password: password);
    } catch (e, s) {
      throw ServerException(e.toString());
    }
  }
}
