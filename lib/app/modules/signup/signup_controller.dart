import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stays_go/app/data/repository/auth_repository.dart';
import 'package:stays_go/app/routes/app_routes.dart';

class SignUpController extends GetxController {
  final repository = Get.find<AuthRepository>();
  final formKey = GlobalKey<FormState>();

  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  void register() async {
    if (formKey.currentState!.validate()) {
      try {
        print("indo fazer o registo");
        await repository.register(usernameController.text,
            passwordController.text, emailController.text);

        Get.defaultDialog(
            title: "Sucesso", content: Text("Usuário cadastrado com sucesso")
        );
        Get.offAndToNamed(Routes.LOGIN);
      } catch (error) {
        Get.defaultDialog(title: "Erro", content: Text(error.toString()));
      }
    }
  }
}
