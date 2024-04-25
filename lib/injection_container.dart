import 'package:get_it/get_it.dart';
import 'package:zarafa/features/main/domain/repositories/main_repository.dart';

import 'features/main/data/datasources/main_datasource.dart';
import 'features/main/data/repositories/main_repository_impl.dart';
import 'features/main/domain/usecases/get_categories.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Use cases
  ///categories
  sl.registerLazySingleton(() => GetCategories(sl()));

  // Repository
  sl.registerLazySingleton<MainRepository>(
    () => MainRepositoryImpl(mainDataSource: sl()),
  );

  // Data sources
  sl.registerLazySingleton<MainDataSource>(
    () => MainDataSourceImp(),
  );
}
