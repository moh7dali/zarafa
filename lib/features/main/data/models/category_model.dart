import 'package:zarafa/features/main/data/models/subcategory_model.dart';
import 'package:zarafa/features/main/domain/entities/subcategory.dart';

import '../../domain/entities/category.dart';

class CategoryModel extends Category {
  CategoryModel(
      {required super.title,
      required super.iconPath,
      required super.numberOfMerchants,
      required super.popularityIndicator,
      required super.subcategories});

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
        title: json['Title'],
        iconPath: json['IconPath'],
        numberOfMerchants: json['NumberOfMerchants'],
        popularityIndicator: json['PopularityIndicator'],
        subcategories: json["Subcategories"] == null ? [] : List<Subcategory>.from(json["Subcategories"]!.map((x) => SubcategoryModel.fromJson(x))),
      );
}
