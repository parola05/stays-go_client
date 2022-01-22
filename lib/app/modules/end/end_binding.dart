import 'package:get/get.dart';
import 'package:stays_go/app/modules/end/end_controller.dart';

class EndBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EndController>(() => EndController());
  }
}
