import 'package:zarafa/features/main/data/models/merchant_model.dart';
import 'package:zarafa/features/main/domain/entities/subcategory.dart';

import '../../domain/entities/merchant.dart';

class SubcategoryModel extends Subcategory {
  SubcategoryModel({required super.title, required super.merchants, required super.iconPath});

  factory SubcategoryModel.fromJson(Map<String, dynamic> json) => SubcategoryModel(
        title: json['Title'],
        iconPath: json['IconPath'],
        merchants: json["Merchants"] == null ? [] : List<Merchant>.from(json["Merchants"]!.map((x) => MerchantModel.fromJson(x))),
      );
}
