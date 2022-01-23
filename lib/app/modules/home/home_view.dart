import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stays_go/app/modules/home/home_controller.dart';
import 'package:stays_go/app/theme/app_theme.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<HomeController>(
        init: HomeController(),
        builder: (controller) => controller.permissionAccepted == false
            ? FutureBuilder(
                future: controller.onInit(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    if (snapshot.hasError) {
                      return Container();
                    } else {
                      return controller.pages[controller.pageSelected];
                    }
                  } else {
                    return Container(
                      color: appThemeData.backgroundColor,
                      child: 
                        Center(child: CircularProgressIndicator())
                      );
                  }
                })
            : controller.pages[controller.pageSelected],
      ),
      bottomNavigationBar: SizedBox(
        height: Get.height / 9,
        child: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.pin_drop_outlined), label: 'MAPA'),
            BottomNavigationBarItem(
                icon: Icon(Icons.star_border), label: 'AVALIAÇÕES'),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings), label: 'DEFINIÇÕES'),
          ],
          backgroundColor: Colors.blue[600],
          currentIndex: controller.pageAppBar,
          selectedItemColor: Colors.black,
          onTap: (index) => {controller.changeBTBSelected(index)},
        ),
      ),
    );
  }
}
