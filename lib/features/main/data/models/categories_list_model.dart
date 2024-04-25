import 'package:zarafa/features/main/data/models/category_model.dart';
import 'package:zarafa/features/main/domain/entities/categories_list.dart';

import '../../domain/entities/category.dart';

class CategoriesListModel extends CategoriesList {
  CategoriesListModel({required super.categories});

  factory CategoriesListModel.fromJson(Map<String, dynamic> json) => CategoriesListModel(
        categories: json["Categories"] == null ? [] : List<Category>.from(json["Categories"]!.map((x) => CategoryModel.fromJson(x))),
      );
}
