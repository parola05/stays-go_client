import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:stays_go/app/modules/home/home_controller.dart';

class Map extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        builder: (controller) => GoogleMap(
              initialCameraPosition: CameraPosition(
                target: LatLng(controller.lat, controller.long),
                zoom: 15.0,
              ),
              onMapCreated: (GoogleMapController gController) {
                gController.setMapStyle(controller.darkMapStyle);
              },
              markers: controller.makers,
            ));
  }
}