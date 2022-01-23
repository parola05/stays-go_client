import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stays_go/app/modules/home/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
            init: HomeController(),
            builder: (controller) {
              return controller.permissionAccepted == true ? 
                Scaffold(
                          body: GetBuilder<HomeController>(
                            init: HomeController(),
                            builder: (controller) =>
                                controller.pages[controller.pageSelected],
                          ),
                          bottomNavigationBar: GetBuilder<HomeController>(
                            builder: (controller) => SizedBox(
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
                          )
                        ):
              FutureBuilder(
                future: controller.onInit(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    if (snapshot.hasError) {
                      return Container();
                    } else {
                      return Scaffold(
                          body: GetBuilder<HomeController>(
                            init: HomeController(),
                            builder: (controller) =>
                                controller.pages[controller.pageSelected],
                          ),
                          bottomNavigationBar: GetBuilder<HomeController>(
                            builder: (controller) => SizedBox(
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
                          )
                        );
                    }
                  } else {
                    return Container();
                  }
                },
              );
            }
    );
  }
}
                  
