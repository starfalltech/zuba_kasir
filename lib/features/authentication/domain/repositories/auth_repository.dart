import 'package:dartz/dartz.dart';

import '../../../../core/exceptions/failure.dart';

abstract class AuthRepository {
  Future<Either<Failure, bool>> registerAuth(String name, String password);

  Future<Either<Failure, bool>> loginAuth(String name, String password);
}
