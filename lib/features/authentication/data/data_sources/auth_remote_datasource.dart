import 'package:firebase_auth/firebase_auth.dart';
import 'package:zuba_karis/exceptions/exceptions.dart';
import 'package:zuba_karis/firebase/auth.dart';

abstract class AuthRemoteDataSource {
  Future<bool> registerAuth(String email, String password);

  Future<bool> loginAuth(String email, String password);
}

class AuthRemoteDataSourceImpl extends AuthRemoteDataSource {
  Auth clientServices;

  AuthRemoteDataSourceImpl(this.clientServices);

  @override
  Future<bool> loginAuth(String email, String password) async {
    try {
      final userLogin = await clientServices.loginAuth(email, password);
      return true;
    } on FirebaseAuthException catch (e) {
      throw ServerException(e.code);
    }
  }

  @override
  Future<bool> registerAuth(String email, String password) async{
    try {
      final userRegister = await clientServices.loginAuth(email, password);
      return true;
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}
