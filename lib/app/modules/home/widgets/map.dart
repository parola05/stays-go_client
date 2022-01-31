import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:stays_go/app/modules/home/home_controller.dart';
import 'package:stays_go/app/theme/app_theme.dart';

class Map extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        builder: (controller) => controller.permissionAccepted == true
            ? GoogleMap(
                initialCameraPosition: CameraPosition(
                  target: LatLng(controller.myLat, controller.myLong),
                  zoom: 16.0,
                ),
                onMapCreated: (GoogleMapController gController) {
                  gController.setMapStyle(controller.darkMapStyle);
                  controller.context = context;
                },
                markers: controller.markers,
              )
            : Container(
                color: appThemeData.backgroundColor,
                child: Center(child: ElevatedButton(
                    onPressed: () {
                      controller.questionLocation();
                    },
                    child: Text(
                      'Conceder acesso a minha localização',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: appThemeData.buttonColor,
                      shape: StadiumBorder(),
                      fixedSize: Size(Get.width * 0.8, Get.height * 0.06),
                    ),
                  ))
            )
    );
  }
}
