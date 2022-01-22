import 'package:get/get.dart';
import 'package:stays_go/app/routes/app_routes.dart';

class SignUpController extends GetxController {
  void register(){
    // TODO: conectar com servidor
    Get.offAndToNamed(Routes.LOGIN);
  }
}