import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stays_go/app/modules/signup/signup_controller.dart';

class SignUpView extends GetView<SignUpController> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('SignUpPage')),
      body: SafeArea(
        child: Text('SignUpController')
      )
    );
  }
}