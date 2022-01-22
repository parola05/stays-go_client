import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stays_go/app/modules/home/home_controller.dart';
import 'package:stays_go/app/theme/app_theme.dart';

class SuccessChanges extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (controller) {
      return Container(
        color: appThemeData.backgroundColor,
        alignment: Alignment.center,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: Get.height / 14),
            Icon(Icons.person_pin,
                size: Get.height / 5, color: appThemeData.buttonColor),
            Text(controller.myUsername, style: TextStyle(color: Colors.white)),
            SizedBox(height: Get.height / 6),
            Center(
              child: Text("ALTERAÇÕES",
                style: TextStyle(color: appThemeData.buttonColor,fontSize: 26),
              ),
            ),
            Center(
              child: Text("EFETUADAS COM",
                style: TextStyle(color: appThemeData.buttonColor,fontSize: 26),
              ),
            ),
            Center(
              child: Text("SUCESSO",
                style: TextStyle(color: appThemeData.buttonColor,fontSize: 26),
              ),
            )
          ],
        ),
      );
    });
  }
}
