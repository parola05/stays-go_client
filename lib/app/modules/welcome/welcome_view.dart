import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stays_go/app/modules/welcome/welcome_controller.dart';

class WelcomeView extends GetView<WelcomeController> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('WelcomeView')),
      body: SafeArea(
        child: Text('WelcomeViewroller')
      )
    );
  }
}