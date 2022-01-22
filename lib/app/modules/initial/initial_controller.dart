import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:stays_go/app/routes/app_routes.dart';

class InitialController extends GetxController {
  final box = GetStorage("stays_go");
  var auth;

  String verifyAuth() {
    auth = box.read("auth");
    if (auth != null) {
      return Routes.HOME;
    } else {
      return Routes.WELCOME;
    }
  }
}
