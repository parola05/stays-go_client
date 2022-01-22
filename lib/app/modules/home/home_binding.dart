import 'package:get/get.dart';
import 'package:stays_go/app/data/repository/client_repository.dart';
import 'package:stays_go/app/modules/home/home_controller.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<ClientRepository>(() => ClientRepository());
  }
}
