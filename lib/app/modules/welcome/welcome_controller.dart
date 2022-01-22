import 'package:get/get.dart';
import 'package:stays_go/app/routes/app_routes.dart';

class WelcomeController extends GetxController {
  void goToLogin(){
    Get.offAndToNamed(Routes.LOGIN);
  }
  
  void goToRegister(){
     Get.offAndToNamed(Routes.SIGNUP);
  }
}