import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:zarafa/core/theme/app_theme.dart';
import 'package:zarafa/features/main/presentation/provider/subcategories_provider.dart';

import '../../domain/entities/category.dart';
import '../screens/subcategory_page.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({super.key, this.category});

  final Category? category;

  @override
  Widget build(BuildContext context) {
    return Consumer<SubCategoryProvider>(
      builder: (context, value, child) {
        return GestureDetector(
          onTap: () {
            value.selectedSubcategory=category?.subcategories?.first;
            value.merchants=[];
            value.merchants=value.selectedSubcategory?.merchants??[];
            value.notifyListeners();
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => SubCategoryPage(
                    category: category,
                  )),
            );
          },
          child: Card(
            color: AppTheme.backCardColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: SingleChildScrollView(
              child: Column(children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Container(
                          decoration: const BoxDecoration(shape: BoxShape.circle, color: AppTheme.primaryColor),
                          width: 25,
                          height: 25,
                          alignment: Alignment.center,
                          child: Text(
                            "${category?.numberOfMerchants ?? ""}",
                            style: AppTheme.textStyle(color: AppTheme.whiteColor),
                          )),
                    )
                  ],
                ),
                Icon(
                  IconData(int.parse(category?.iconPath ?? ""), fontFamily: 'MaterialIcons'),
                  size: 35.sp,
                  color: AppTheme.primaryColor,
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Expanded(
                        child: Text(
                          category?.title ?? "",
                          textAlign: TextAlign.center,
                          style: AppTheme.textStyle(color: AppTheme.blackColor, size: AppTheme.size14),
                        ))
                  ],
                )
              ]),
            ),
          ),
        );
      },
    );
  }
}
