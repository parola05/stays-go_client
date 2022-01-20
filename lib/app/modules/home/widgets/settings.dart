import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stays_go/app/theme/app_theme.dart';

class Settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: appThemeData.backgroundColor,
      alignment: Alignment.center,
      child: Column(
        children: [
          SizedBox(height: Get.height / 10),
          Icon(Icons.person_pin, size: Get.height / 5,color: appThemeData.buttonColor),
          Text("myUsername",style: TextStyle(color: Colors.white)),
          SizedBox(height: Get.height / 6),
          ElevatedButton(
            onPressed: () {},
            child: Text(
              'MUDAR PALAVRA-PASSE',
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
            onPressed: () {},
            child: Text(
              'MUDAR ENDEREÇO DE E-MAIL',
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
            onPressed: () {},
            child: Text(
              'TERMINAR SESSÃO',
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
          )
        ],
      ),
    );
  }
}
