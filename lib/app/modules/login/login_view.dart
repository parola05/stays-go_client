import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stays_go/app/modules/login/login_controller.dart';
import 'package:stays_go/app/theme/app_theme.dart';

class LoginView extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appThemeData.backgroundColor,
      //alignment: Alignment.center,
      body: SingleChildScrollView(
        child: Form(
          key: controller.formKey,
          child: Column(children: [
            SizedBox(height: Get.height / 10),
            Align(
              alignment: Alignment(-0.5, 2),
              child: Text(
                'BEM-VINDO DE VOLTA!',
                style: TextStyle(
                  color: appThemeData.buttonColor,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.none,
                  fontSize: 20,
                ),
              ),
            ),
            SizedBox(height: Get.height / 3),
            Align(
              alignment: Alignment(-0.5, 2),
              child: Text(
                'NOME DO UTILIZADOR',
                style: TextStyle(
                  color: appThemeData.buttonColor,
                  decoration: TextDecoration.none,
                  fontSize: 16,
                ),
              ),
            ),
            SizedBox(height: Get.height / 40),
            Container(
              width: Get.width * 0.8,
              height: Get.height * 0.06,
              child: TextFormField(
                controller: controller.usernameController,
                validator: (value) {
                      if (value!.isEmpty) {
                        return 'Campo requerido';
                      }
                      return null;
                },
                decoration: InputDecoration(
                  border:
                      OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
                  filled: true,
                  fillColor: Color.fromRGBO(69, 98, 127, 0.4),
                ),
              ),
            ),
            SizedBox(height: Get.height / 45),
            Align(
              alignment: Alignment(-0.5, 2),
              child: Text(
                'PALAVRA-PASSE',
                style: TextStyle(
                  color: appThemeData.buttonColor,
                  decoration: TextDecoration.none,
                  fontSize: 16,
                ),
              ),
            ),
            SizedBox(height: Get.height / 45),
            Container(
              width: Get.width * 0.8,
              height: Get.height * 0.06,
              child: TextFormField(
                controller: controller.passwordController,
                validator: (value) {
                      if (value!.isEmpty) {
                        return 'Campo requerido';
                      }
                      return null;
                },
                decoration: InputDecoration(
                  border:
                      OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
                  filled: true,
                  fillColor: Color.fromRGBO(69, 98, 127, 0.5),
                ),
              ),
            ),
            SizedBox(height: Get.height / 30),
            ElevatedButton(
              onPressed: () {
                controller.login();
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
            SizedBox(height: Get.height / 10),
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
          ]),
        ),
      ),
    );
  }
}
