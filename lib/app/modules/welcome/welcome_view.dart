import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:stays_go/app/modules/welcome/welcome_controller.dart';
import 'package:stays_go/app/theme/app_theme.dart';

class WelcomeView extends GetView<WelcomeController> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: appThemeData.backgroundColor,
      alignment: Alignment.center,
      child: Column(
        children: [
          SizedBox(height: Get.height / 10),
          SvgPicture.asset("assets/staysGoLogo-01.svg",
              height: Get.height * 0.4),
          SizedBox(height: Get.height / 10),
          ElevatedButton(
            onPressed: () {
              controller.goToLogin();
            },
            child: Text(
              'LOGIN',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            style: ElevatedButton.styleFrom(
              primary: appThemeData.buttonColor,
              shape: StadiumBorder(),
              fixedSize: Size(Get.width * 0.8, Get.height * 0.06),
            ),
          ),
          SizedBox(height: Get.height / 40),
          ElevatedButton(
            onPressed: () {
              controller.goToRegister();
            },
            child: Text(
              'REGISTAR',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            style: ElevatedButton.styleFrom(
              primary: appThemeData.buttonColor,
              shape: StadiumBorder(),
              fixedSize: Size(Get.width * 0.8, Get.height * 0.06),
            ),
          ),
          SizedBox(height: Get.height / 8),
          Column(
            children: <Widget>[
              Align(
                alignment: Alignment(0.7, 1),
                child: Wrap(children: [
                  Text(
                    'DGRTech',
                    style: TextStyle(
                        color: Colors.blue,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.none),
                  ),
                  Text(
                    'TM',
                    style: TextStyle(
                        fontFeatures: [FontFeature.superscripts()],
                        color: appThemeData.buttonColor,
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.none),
                  ),
                ]),
              ),
            ],
          )
        ],
      ),
    );
  }
}
