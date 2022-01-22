import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stays_go/app/modules/home/home_controller.dart';
import 'package:stays_go/app/theme/app_theme.dart';

class MailConfig extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appThemeData.backgroundColor,
      body: GetBuilder<HomeController>(builder: (controller) {
        return SingleChildScrollView(
          child: Form(
            key: controller.formMailConfigKey,
            child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              SizedBox(height: Get.height / 14),
              Icon(Icons.person_pin,
                  size: Get.height / 5, color: appThemeData.buttonColor),
              Text("myUsername", style: TextStyle(color: Colors.white)),
              SizedBox(height: Get.height / 30),
              Align(
                alignment: Alignment(-0.5, 2),
                child: Text(
                  'ANTIGO ENDEREÇO DE E-MAIL',
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
                  controller: controller.oldMailController,
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
                  'NOVO ENDEREÇO DE E-MAIL',
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
                  controller: controller.newMailController,
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
                    fillColor: Color.fromRGBO(69, 98, 127, 0.5),
                  ),
                ),
              ),
              SizedBox(height: Get.height / 30),
              Align(
                alignment: Alignment(-0.5, 2),
                child: Text(
                  'REPETIR NOVO ENDEREÇO DE E-MAIL',
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
                 controller: controller.newMailAgainController,
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
                    fillColor: Color.fromRGBO(69, 98, 127, 0.5),
                  ),
                ),
              ),
              SizedBox(height: Get.height / 30),
              ElevatedButton(
                onPressed: () {
                  controller.changeMail();
                },
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
              SizedBox(height: Get.height / 50),
            ]),
          ),
        );
      }),);
  }
}
