import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/categories_list.dart';

abstract class MainRepository {
  Future<Either<AppFailure, CategoriesList>> getCategoriesList();
}
