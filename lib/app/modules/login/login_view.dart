import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stays_go/app/modules/login/login_controller.dart';

class LoginView extends GetView<LoginController> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('LoginPage')),
      body: SafeArea(
        child: Text('LoginController')
      )
    );
  }
}