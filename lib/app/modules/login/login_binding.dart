import 'package:get/get.dart';
import 'package:stays_go/app/data/repository/auth_repository.dart';
import 'package:stays_go/app/modules/login/login_controller.dart';

class LoginBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(() => LoginController());
    Get.lazyPut<AuthRepository>(() => AuthRepository());
  }
}
