import 'package:dartz/dartz.dart';
import 'package:zuba_karis/exceptions/exceptions.dart';
import 'package:zuba_karis/exceptions/failure.dart';
import 'package:zuba_karis/features/authentication/domain/repositories/auth_repository.dart';
import 'package:zuba_karis/network_info/network_info.dart';

import '../data_sources/auth_remote_datasource.dart';

class AuthRepositoryImpl extends AuthRepository {
  final NetworkInfo networkInfo;
  final AuthRemoteDataSource dataSource;

  AuthRepositoryImpl({required this.dataSource,required this.networkInfo});

  @override
  Future<Either<Failure, bool>> loginAuth(String email, String password) async {
    if (await networkInfo.isConnected) {
      try {
        final result = await dataSource.loginAuth(email, password);
        return Right(result);
      } on ServerException catch (e) {
        return Left(ServerFailure(e.msg));
      }
    } else {
      return Left(InternalFailure('Kamu Sedang Offline Nyalakan Data'));
    }
  }

  @override
  Future<Either<Failure, bool>> registerAuth(String email, String password) async{
    if (await networkInfo.isConnected) {
      try {
        final result = await dataSource.registerAuth(email, password);
        return Right(result);
      } on ServerException catch (e) {
        return Left(ServerFailure(e.toString()));
      }
    } else {
      return Left(InternalFailure('Kamu Sedang Offline Nyalakan Data'));
    }
  }
}
