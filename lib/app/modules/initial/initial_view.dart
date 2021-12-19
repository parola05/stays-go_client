import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stays_go/app/modules/initial/initial_controller.dart';

class InitialView extends GetView<InitialController> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('InitialPages')),
      body: SafeArea(
        child: Text('InitialController')
      )
    );
  }
}