import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:stays_go/app/routes/app_pages.dart';
import 'package:stays_go/app/routes/app_routes.dart';
import 'package:stays_go/app/theme/app_theme.dart';

void main() async{
  await GetStorage.init("stays_go");
  runApp(GetMaterialApp(
    title: "Stays Go",
    debugShowCheckedModeBanner: false,
    initialRoute: Routes.INITIAL,
    getPages: AppPages.routes,
    theme: appThemeData,
  ));
}
