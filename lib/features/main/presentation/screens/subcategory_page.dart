import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zarafa/features/main/presentation/provider/subcategories_provider.dart';
import 'package:zarafa/features/main/presentation/widgets/subcategories_widget.dart';

import '../../../../core/theme/app_theme.dart';
import '../../domain/entities/category.dart';
import '../widgets/merchant_widget.dart';

class SubCategoryPage extends StatelessWidget {
  const SubCategoryPage({super.key, this.category});

  final Category? category;

  @override
  Widget build(BuildContext context) {
    return Consumer<SubCategoryProvider>(
      builder: (context, controller, child) {
        return Scaffold(
          appBar: AppBar(
            title: Text(category?.title ?? "", style: AppTheme.textStyle(color: AppTheme.blackColor, size: AppTheme.size18)),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Sub Categories",
                        style: AppTheme.textStyle(color: AppTheme.blackColor, size: AppTheme.size16),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * .15,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: category?.subcategories?.length ?? 0,
                    itemBuilder: (context, index) {
                      return SubCategoriesWidget(
                        subcategory: category?.subcategories?[index],
                      );
                    },
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "All Offers from ${category?.title ?? ""}",
                        style: AppTheme.textStyle(color: AppTheme.blackColor, size: AppTheme.size16),
                      ),
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.search,
                          color: AppTheme.primaryColor,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: DropdownButton<String>(
                            value: controller.selectedSort,
                            iconEnabledColor: AppTheme.primaryColor,
                            iconDisabledColor: AppTheme.primaryColor,
                            items: controller.sortTypeList
                                .map((String sortType) => DropdownMenuItem<String>(
                                      value: sortType,
                                      child: Text(
                                        sortType,
                                        style: AppTheme.textStyle(color: AppTheme.blackColor, size: AppTheme.size14),
                                      ),
                                    ))
                                .toList(),
                            onChanged: (value) {
                              controller.changeSortType(value!);
                            },
                            hint: Text(
                              "Sort",
                              style: AppTheme.textStyle(color: AppTheme.primaryColor, size: AppTheme.size16),
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
                DefaultTabController(
                  length: 27,
                  child: TabBar(
                    indicator: const BoxDecoration(
                      // Custom indicator for selected tab
                      border: Border(
                        bottom: BorderSide(color: Colors.transparent, width: 1.0), // Example colored border
                      ),
                    ),
                    tabAlignment: TabAlignment.start,
                    controller: controller.tabController,
                    isScrollable: true,
                    onTap: (index) {
                      if (index == 0) {
                        controller.selectedLetter = "";
                        controller.merchants = [];
                        controller.merchants?.addAll((controller.selectedSubcategory?.merchants ?? []));
                        controller.merchants?.sort((a, b) {
                          return controller.selectedSort == "A-Z"
                              ? (a.merchantTitle ?? "").compareTo((b.merchantTitle ?? ""))
                              : (b.merchantTitle ?? "").compareTo(a.merchantTitle ?? "");
                        });
                      } else {
                        controller.selectedLetter = String.fromCharCode(65 + index - 1);
                        controller.merchants = [];
                        controller.merchants?.addAll((controller.selectedSubcategory?.merchants ?? [])
                            .where((element) => (element.merchantTitle ?? "").startsWith(controller.selectedLetter)));
                      }
                      controller.notifyListeners();
                    },
                    tabs: [
                      Card(
                          shape: RoundedRectangleBorder(
                              side: BorderSide(color: controller.selectedLetter == "" ? AppTheme.primaryColor : AppTheme.whiteColor, width: 2),
                              borderRadius: BorderRadius.circular(10)),
                          surfaceTintColor: AppTheme.whiteColor,
                          color: controller.selectedLetter == "" ? AppTheme.backCardColor : AppTheme.whiteColor,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: Tab(text: "All"),
                          )),
                      ...List.generate(
                          26,
                          (index) => Card(
                              shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                      color:
                                          controller.selectedLetter == String.fromCharCode(65 + index) ? AppTheme.primaryColor : AppTheme.whiteColor,
                                      width: 2),
                                  borderRadius: BorderRadius.circular(10)),
                              surfaceTintColor: AppTheme.whiteColor,
                              color: controller.selectedLetter == String.fromCharCode(65 + index) ? AppTheme.backCardColor : AppTheme.whiteColor,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 15),
                                child: Tab(text: String.fromCharCode(65 + index)),
                              ))), // Generate tabs A-Z
                    ],
                  ),
                ),
                ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: controller.merchants?.length ?? 0,
                  itemBuilder: (context, index) {
                    return MerchantsWidget(merchant: controller.merchants?[index]);
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
