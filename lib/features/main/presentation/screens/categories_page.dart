import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zarafa/core/theme/app_theme.dart';

import '../provider/main_provider.dart';
import '../widgets/categories_widget.dart';

class CategoriesPage extends StatelessWidget {
  const CategoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<CategoriesProvider>(
      builder: (context, value, child) {
        return Scaffold(
          appBar: AppBar(
            title: Text("Categories", style: AppTheme.textStyle(color: AppTheme.blackColor, size: AppTheme.size18)),
          ),
          body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    shape: RoundedRectangleBorder(side: BorderSide(color: Colors.grey.withOpacity(.65),width: 1),borderRadius: BorderRadius.circular(10)),
                    color: AppTheme.whiteColor,
                    child: TextField(
                      onChanged: (val) {
                        value.searchFun(val);
                      },
                      decoration: InputDecoration(
                          border: OutlineInputBorder(borderSide: BorderSide(color: AppTheme.whiteColor)),
                          enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: AppTheme.whiteColor)),
                          focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: AppTheme.whiteColor)),
                          hintText: 'Search Category',
                          hintStyle: AppTheme.textStyle(color: Colors.grey, size: AppTheme.size16),
                          contentPadding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                          prefixIcon: Icon(Icons.search)),
                    ),
                  ),
                ),
                if ((value.popularCategories ?? []).isNotEmpty && !value.isSearch)
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Popular Categories",
                          style: AppTheme.textStyle(color: AppTheme.blackColor, size: AppTheme.size16),
                        ),
                      ),
                    ],
                  ),
                if ((value.popularCategories ?? []).isNotEmpty && !value.isSearch)
                  GridView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3, crossAxisSpacing: 16, mainAxisSpacing: 16, childAspectRatio: .9),
                    shrinkWrap: true,
                    itemCount: value.popularCategories?.length ?? 0,
                    itemBuilder: (context, index) {
                      return CategoryWidget(
                        category: value.popularCategories?[index],
                      );
                    },
                  ),
                if (!value.isSearch)
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "All Categories",
                          style: AppTheme.textStyle(color: AppTheme.blackColor, size: AppTheme.size16),
                        ),
                      ),
                    ],
                  ),
                GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3, crossAxisSpacing: 16, mainAxisSpacing: 16, childAspectRatio: .9),
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: value.searchCategories?.length ?? 0,
                  itemBuilder: (context, index) {
                    return CategoryWidget(
                      category: value.searchCategories?[index],
                    );
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
