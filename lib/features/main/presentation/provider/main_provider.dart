import 'package:flutter/material.dart';

import '../../../../injection_container.dart';
import '../../domain/entities/category.dart';
import '../../domain/usecases/get_categories.dart';

class CategoriesProvider extends ChangeNotifier {
  GetCategories getCategories;
  List<Category>? categories = [];
  List<Category>? searchCategories = [];
  List<Category>? popularCategories = [];

  bool isSearch = false;

  CategoriesProvider() : getCategories = sl() {
    getCategoriesData();
  }

  TextEditingController branchController = TextEditingController();

  Future getCategoriesData() async {
    categories = [];
    searchCategories = [];
    popularCategories = [];
    await getCategories.mainRepository.getCategoriesList().then((value) => value.fold((failure) {
          print("Error ${failure.errorsModel.errorMessage}");
          notifyListeners();
        }, (data) async {
          categories = data.categories;
          searchCategories = categories;
          popularCategories?.addAll((categories?.where((element) => element.popularityIndicator ?? false) ?? []));
          searchCategories?.removeWhere(
            (element) => element.popularityIndicator ?? false,
          );
          notifyListeners();
        }));
  }

  void searchFun(String value) {
    if (value.isNotEmpty) {
      searchCategories =
          [...?popularCategories, ...?categories].where((category) => (category.title ?? "").toLowerCase().contains(value.toLowerCase())).toList();
      isSearch = true;
      notifyListeners();
    } else {
      isSearch = false;
      searchCategories = categories;
      notifyListeners();
    }
  }
}
