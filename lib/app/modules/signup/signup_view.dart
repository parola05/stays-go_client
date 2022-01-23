import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stays_go/app/modules/signup/signup_controller.dart';
import 'package:stays_go/app/theme/app_theme.dart';

class SignUpView extends GetView<SignUpController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appThemeData.backgroundColor,
      //alignment: Alignment.center,
      body: SingleChildScrollView(
          child: Form(
              key: controller.formKey,
              child: Column(
                children: [
                SizedBox(height: Get.height / 10),
                 Text(
                      'TORNE-SE MEMBRO DA',
                      style: TextStyle(
                        color: appThemeData.buttonColor,
                        decoration: TextDecoration.none,
                        fontSize: 20,
                      ),
                    ),
                  Text(
                    'STAYS GO',
                    style: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.none,
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(height: Get.height / 7),
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
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(32.0)),
                        filled: true,
                        fillColor: Color.fromRGBO(69, 98, 127, 0.4),
                      ),
                    ),
                  ),
                  SizedBox(height: Get.height / 45),
                  Align(
                    alignment: Alignment(-0.5, 2),
                    child: Text(
                      'ENDEREÇO DE EMAIL',
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
                      controller: controller.emailController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(32.0)),
                        filled: true,
                        fillColor: Color.fromRGBO(69, 98, 127, 0.5),
                      ),
                    ),
                  ),
                  SizedBox(height: Get.height / 30),
                  Align(
                    alignment: Alignment(-0.5, 2),
                    child: Text(
                      'PALAVRA PASSE',
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
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Campo requerido';
                        }
                        return null;
                      },
                      controller: controller.passwordController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(32.0)),
                        filled: true,
                        fillColor: Color.fromRGBO(69, 98, 127, 0.5),
                      ),
                    ),
                  ),
                  SizedBox(height: Get.height / 30),
                  ElevatedButton(
                    onPressed: () {
                      controller.register();
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
                                color: Colors.blue,
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.none),
                          ),
                        ]),
                      ),
                    ],
                  )
                ]),
              )
            ),
    );
  }
}
