import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:zarafa/core/constants/app_constants.dart';
import 'package:zarafa/features/main/data/models/categories_list_model.dart';
import 'package:zarafa/features/main/domain/entities/categories_list.dart';

abstract class MainDataSource {
  Future<CategoriesList> getCategoriesFromJson();
}

class MainDataSourceImp extends MainDataSource {
  @override
  Future<CategoriesList> getCategoriesFromJson() async {
    final String jsonString = await rootBundle.loadString(AppConstants.categoriesJSonFile);
    CategoriesListModel categoriesList = await CategoriesListModel.fromJson(json.decode(jsonString));
    return categoriesList;
  }
}
