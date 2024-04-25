import 'package:dartz/dartz.dart';
import 'package:zarafa/core/error/failures.dart';

import '../../../../core/error/error_model.dart';
import '../../domain/entities/categories_list.dart';
import '../../domain/repositories/main_repository.dart';
import '../datasources/main_datasource.dart';

class MainRepositoryImpl extends MainRepository {
  MainDataSource mainDataSource;

  MainRepositoryImpl({required this.mainDataSource});

  @override
  Future<Either<AppFailure, CategoriesList>> getCategoriesList() async {
    try {
      final categoryData = await mainDataSource.getCategoriesFromJson();
      return Right(categoryData);
    } catch (e) {
      return Left(AppFailure(errorsModel: ErrorsModel(errorCode: "100", errorMessage: "$e"), failureType: FailureType.serverFailure));
    }
  }
}
