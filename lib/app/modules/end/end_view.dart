import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:stays_go/app/modules/end/end_controller.dart';
import 'package:stays_go/app/theme/app_theme.dart';

class EndView extends GetView<EndController> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          SplashScreen(
            seconds: 5,
            backgroundColor: appThemeData.backgroundColor,
            navigateAfterSeconds: controller.goToWelcome(),
            loaderColor: Colors.transparent,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                margin: EdgeInsets.all(30),
                child: SvgPicture.asset(
                  "assets/staysGoLogo-01.svg",
                  height: Get.height/ 2.6,
                ),
              ),
              Center(
              child: Text("TERMINOU SESSÃO",
                style: TextStyle(color: appThemeData.buttonColor,fontWeight: FontWeight.bold, fontSize: 24),
              ),
              ),
              Column(
              children: <Widget>[
                Align(
                  alignment: Alignment(0.7, 1),
                  child: Wrap(children: [
                    Text(
                      'DGRTech',
                      style: TextStyle(
                          color: appThemeData.buttonColor,
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
        ],
      ),
    );
  }
}