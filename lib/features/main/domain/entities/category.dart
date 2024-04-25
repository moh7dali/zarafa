import 'package:equatable/equatable.dart';
import 'package:zarafa/features/main/domain/entities/subcategory.dart';

class Category extends Equatable {
  String? title;
  String? iconPath;
  int? numberOfMerchants;
  bool? popularityIndicator;
  List<Subcategory>? subcategories;

  Category({this.title, this.iconPath, this.subcategories, this.popularityIndicator, this.numberOfMerchants});

  @override
  List<Object?> get props => [title, iconPath, numberOfMerchants, popularityIndicator, subcategories];
}
