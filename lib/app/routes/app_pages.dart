import 'package:esolutions/app/modules/login/bindings/login_binding.dart';
import 'package:esolutions/app/modules/login/views/screens/login_view.dart';
import 'package:get/get.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.Login;

  static final routes = [
    GetPage(
      name: _Paths.Login,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
  ];
}
