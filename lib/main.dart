import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stays_go/app/routes/app_pages.dart';
import 'package:stays_go/app/routes/app_routes.dart';
import 'package:stays_go/app/theme/app_theme.dart';

void main() {
  runApp(GetMaterialApp(
    title: "Stays Go",
    debugShowCheckedModeBanner: false,
    theme: appThemeData,
    initialRoute: Routes.INITIAL,
    getPages: AppPages.routes,
  ));
}
