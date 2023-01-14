import 'package:dartz/dartz.dart';
import 'package:zuba_karis/exceptions/failure.dart';

abstract class AuthRepository {
  Future<Either<Failure, bool>> registerAuth(String email,String password);

  Future<Either<Failure, bool>> loginAuth(String email,String password);
}
