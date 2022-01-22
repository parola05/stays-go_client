import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stays_go/app/routes/app_routes.dart';

class LoginController extends GetxController {
  final formKey = GlobalKey<FormState>();

  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void login() {
    if (formKey.currentState!.validate()) {
      print(usernameController.text);
      print(passwordController.text);
      
      Get.offAndToNamed(Routes.HOME);
    }
  }
}
