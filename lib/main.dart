import 'package:assignment_cloudcraftz/app/constants/constant.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'app/routes/app_pages.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Application",
      theme: ThemeData(
          primaryColor: R.primaryColor,
          scaffoldBackgroundColor: R.scaffoldBackgroundColor,
          appBarTheme: const AppBarTheme(backgroundColor: R.appBarColor)),
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    );
  }
}
