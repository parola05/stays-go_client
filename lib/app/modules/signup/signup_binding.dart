import 'package:get/get.dart';
import 'package:stays_go/app/data/repository/auth_repository.dart';
import 'package:stays_go/app/modules/signup/signup_controller.dart';

class SignUpBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SignUpController>(() => SignUpController());
    Get.lazyPut<AuthRepository>(() => AuthRepository());
  }
}
