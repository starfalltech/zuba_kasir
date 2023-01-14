import 'package:firebase_auth/firebase_auth.dart';

class Auth {

  Future<UserCredential> registerAuth(String email, String password) async {
    try {
      return await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw FirebaseAuthException(code: 'The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        throw FirebaseAuthException(
            code: 'The account already exists for that email.');
      } else {
        throw Exception('error $e}');
      }
    } catch (e) {
      throw Exception('error $e}');
    }
  }

  Future<UserCredential> loginAuth(String email, String password) async {
    try {
      return await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw FirebaseAuthException(code: 'email atau password salah');
    }
  }
}
