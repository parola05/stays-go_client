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
                target: LatLng(controller.myLat, controller.myLong),
                zoom: 16.0,
              ),
              onMapCreated: (GoogleMapController gController) {
                gController.setMapStyle(controller.darkMapStyle);
                controller.context = context;
              },
              markers: controller.markers,
            ));
  }
}
