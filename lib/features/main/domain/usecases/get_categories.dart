import 'package:dartz/dartz.dart';
import 'package:zarafa/core/error/failures.dart';

import '../../../../core/usecases/usecase.dart';
import '../entities/categories_list.dart';
import '../repositories/main_repository.dart';

class GetCategories implements UseCase<CategoriesList, NoParams> {
  MainRepository mainRepository;

  GetCategories(this.mainRepository);

  @override
  Future<Either<AppFailure, CategoriesList>> call(NoParams params) async {
    return await mainRepository.getCategoriesList();
  }
}
