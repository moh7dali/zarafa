import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:zarafa/core/theme/app_theme.dart';
import 'package:zarafa/features/main/domain/entities/subcategory.dart';

import '../provider/subcategories_provider.dart';

class SubCategoriesWidget extends StatelessWidget {
  const SubCategoriesWidget({super.key, this.subcategory});

  final Subcategory? subcategory;

  @override
  Widget build(BuildContext context) {
    return Consumer<SubCategoryProvider>(
      builder: (context, controller, child) {
        return GestureDetector(
          onTap: () {
            controller.selectedSubcategory = subcategory;
            controller.merchants = [];
            controller.selectedLetter = "";
            controller.tabController?.index = 0;
            controller.tabController?.animateTo(0);
            controller.merchants = controller.selectedSubcategory?.merchants ?? [];
            controller.merchants?.sort((a, b) {
              return controller.selectedSort == "A-Z"
                  ? (a.merchantTitle ?? "").compareTo((b.merchantTitle ?? ""))
                  : (b.merchantTitle ?? "").compareTo(a.merchantTitle ?? "");
            });
            controller.notifyListeners();
          },
          child: Column(
            children: [
              Card(
                color: AppTheme.backCardColor,
                shape: RoundedRectangleBorder(
                  side: BorderSide(color: controller.selectedSubcategory == subcategory ? AppTheme.primaryColor : AppTheme.whiteColor),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Icon(
                    IconData(int.parse(subcategory?.iconPath ?? ""), fontFamily: 'MaterialIcons'),
                    size: 35.sp,
                    color: AppTheme.primaryColor,
                  ),
                ),
              ),
              Row(
                children: [
                  Text(
                    subcategory?.title ?? "",
                    textAlign: TextAlign.center,
                    style: AppTheme.textStyle(color: AppTheme.blackColor, size: AppTheme.size14),
                  )
                ],
              )
            ],
          ),
        );
      },
    );
  }
}
