import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stays_go/app/routes/app_routes.dart';

class SignUpController extends GetxController {
  final formKey = GlobalKey<FormState>();

  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  void register() {
    // TODO: conectar com servidor
    if (formKey.currentState!.validate()) {
      print(usernameController.text);
      print(passwordController.text);
      print(emailController.text);
      Get.offAndToNamed(Routes.LOGIN);
    }
  }
}
