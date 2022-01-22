import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:stays_go/app/modules/initial/initial_controller.dart';
import 'package:stays_go/app/theme/app_theme.dart';

class InitialView extends GetView<InitialController> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          SplashScreen(
            seconds: 5,
            backgroundColor: appThemeData.backgroundColor,
            navigateAfterSeconds: controller.verifyAuth(),
            loaderColor: Colors.transparent,
          ),
          Container(
            margin: EdgeInsets.all(30),
            child: SvgPicture.asset(
              "assets/staysGoLogo-01.svg",
            ),
          ),
        ],
      ),
    );
  }
}