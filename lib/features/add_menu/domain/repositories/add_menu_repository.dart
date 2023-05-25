import 'package:dartz/dartz.dart';
import 'package:zuba_karis/features/add_menu/domain/entities/menu_entity.dart';

import '../../../../core/exceptions/failure.dart';

abstract class AddMenuRepository {
  Future<Either<Failure, bool>> addMenu(MenuEntity model);
}
