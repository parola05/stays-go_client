import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:stays_go/app/modules/home/widgets/evaluations.dart';
import 'package:stays_go/app/modules/home/widgets/settings.dart';
import 'package:stays_go/app/modules/home/widgets/map.dart';
import 'package:flutter/services.dart' show rootBundle;

class HomeController extends GetxController {
  late String darkMapStyle;

  @override
  void onInit() {
    _loadMapStyles();
    makers.add(marker);
    super.onInit();
  }

  Future _loadMapStyles() async {
    darkMapStyle = await rootBundle.loadString('assets/map_styles/dark.json');
  }

  // Home
  var pages = [
    Map(),
    Evaluations(),
    Settings(),
  ];

  var BTBSelected = 0;

  void changeBTBSelected(int index) {
    BTBSelected = index;
    update();
  }

  //map
  Set<Marker> makers = new Set<Marker>();
  final Marker marker = Marker(
    markerId: new MarkerId("1"),
    position: LatLng(41.5465981, -8.41987),
    infoWindow: InfoWindow(title: "Mércure", snippet: 'Braga/PT'),
  );
  double lat = 41.5465981;
  double long = -8.41987;
}
