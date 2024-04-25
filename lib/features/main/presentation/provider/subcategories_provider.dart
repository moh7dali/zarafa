import 'package:flutter/material.dart';

import '../../domain/entities/merchant.dart';
import '../../domain/entities/subcategory.dart';

class SubCategoryProvider extends ChangeNotifier {
  List<String> sortTypeList = ["A-Z", "Z-A"];
  String selectedSort = "A-Z";

  Subcategory? selectedSubcategory;
  List<Merchant>? merchants;
  TabController? tabController;
  String selectedLetter = "";

  changeSortType(String newType) {
    selectedSort = newType;
    merchants?.sort((a, b) {
      return selectedSort == "A-Z"
          ? (a.merchantTitle ?? "").compareTo((b.merchantTitle ?? ""))
          : (b.merchantTitle ?? "").compareTo(a.merchantTitle ?? "");
    });
    notifyListeners();
  }
}
