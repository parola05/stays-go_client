import 'package:get/get.dart';
import 'package:stays_go/app/routes/app_routes.dart';

class InitialController extends GetxController {
  String verifyAuth() {
    // verifica se já está logada, caso estiver vai para a HOME direto
    // caso contrário vai para WELCOME
    return Routes.WELCOME;
  }
}
