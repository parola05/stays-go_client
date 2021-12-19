import 'package:stays_go/app/modules/home/home_binding.dart';
import 'package:stays_go/app/modules/home/home_view.dart';
import 'package:stays_go/app/modules/initial/initial_binding.dart';
import 'package:stays_go/app/modules/initial/initial_view.dart';
import 'package:stays_go/app/modules/login/login_binding.dart';
import 'package:stays_go/app/modules/login/login_view.dart';
import 'package:stays_go/app/modules/signup/signup_binding.dart';
import 'package:stays_go/app/modules/signup/signup_view.dart';
import 'package:stays_go/app/modules/welcome/welcome_binding.dart';
import 'package:stays_go/app/modules/welcome/welcome_view.dart';
import 'package:stays_go/app/routes/app_routes.dart';
import 'package:get/get.dart';

class AppPages {
  static const INITIAL = Routes.INITIAL;

  static final routes = [
    GetPage(
      name: Routes.INITIAL,
      page: () => InitialView(),
      binding: InitialBinding(),
    ),
    GetPage(
      name: Routes.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(), //InitialBinding(),
    ),
    GetPage(
      name: Routes.WELCOME,
      page: () => WelcomeView(),
      binding: WelcomeBinding(), //InitialBinding(),
    ),
    GetPage(
      name: Routes.SIGNUP,
      page: () => SignUpView(),
      binding: SignUpBinding(), //InitialBinding(),
    ),
    GetPage(
      name: Routes.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
  ];
}
