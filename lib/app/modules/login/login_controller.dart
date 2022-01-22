import 'package:get/get.dart';
import 'package:stays_go/app/routes/app_routes.dart';

class LoginController extends GetxController {
  void login(){
    // TODO: invocar servidor 
    Get.offAndToNamed(Routes.HOME);
  }
}