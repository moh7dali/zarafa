import 'package:equatable/equatable.dart';

import 'category.dart';

class CategoriesList extends Equatable {
  List<Category>? categories;

  CategoriesList({
    this.categories,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [categories];
}
