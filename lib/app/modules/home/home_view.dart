import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stays_go/app/modules/home/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('HomeView')),
      body: SafeArea(
        child: Text('HomeViewroller')
      )
    );
  }
}