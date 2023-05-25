import 'package:dartz/dartz.dart';
import 'package:zuba_karis/core/exceptions/failure.dart';
import 'package:zuba_karis/features/add_menu/data/data_sources/add_menu_remote_datasource.dart';
import 'package:zuba_karis/features/add_menu/domain/entities/menu_entity.dart';
import 'package:zuba_karis/features/add_menu/domain/repositories/add_menu_repository.dart';

import '../../../../core/exceptions/exceptions.dart';
import '../../../../core/network_info/network_info.dart';

class AddMenuRepositoryImpl extends AddMenuRepository {
  final NetworkInfo networkInfo;
  final AddMenuRemoteDataSource dataSource;

  AddMenuRepositoryImpl({required this.dataSource, required this.networkInfo});
  @override
  Future<Either<Failure, bool>> addMenu(MenuEntity model) async {
    if (await networkInfo.isConnected) {
      try {
        final result = await dataSource.addMenu(model);
        return Right(result);
      } on ServerException catch (e) {
        return Left(ServerFailure(e.msg));
      }
    } else {
      return Left(InternalFailure('Kamu Sedang Offline Nyalakan Data'));
    }
  }
}
