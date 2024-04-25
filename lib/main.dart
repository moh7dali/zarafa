import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:zarafa/features/main/presentation/provider/merchant_provider.dart';

import 'features/main/presentation/provider/main_provider.dart';
import 'features/main/presentation/provider/subcategories_provider.dart';
import 'features/main/presentation/screens/categories_page.dart';
import 'injection_container.dart' as di;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) {
              return CategoriesProvider();
            },
          ),
          ChangeNotifierProvider(
            create: (context) {
              return SubCategoryProvider();
            },
          ),
          ChangeNotifierProvider(
            create: (context) {
              return MerchantProvider();
            },
          ),
        ],
        child: ScreenUtilInit(
          designSize: const Size(360, 690),
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (context, child) {
            return MaterialApp(
              title: 'zarafa',
              debugShowCheckedModeBanner: false,
              home: CategoriesPage(),
            );
          },
        ));
  }
}
