import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:stays_go/app/data/model/auth_model.dart';
import 'package:stays_go/app/data/repository/auth_repository.dart';
import 'package:stays_go/app/routes/app_routes.dart';

class LoginController extends GetxController {
  final box = GetStorage("stays_go");
  final repository = Get.find<AuthRepository>();

  final formKey = GlobalKey<FormState>();

  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void login() async {
    if (formKey.currentState!.validate()) {
      try {
        Auth auth = await repository.login(
            usernameController.text, passwordController.text);
        box.write("auth", auth.toJson());
        Get.offAndToNamed(Routes.HOME);
      } catch (error) {
        Get.defaultDialog(title: "Erro", content: Text(error.toString()));
      }
    }
  }
}
