import '../../binding/binding_app.dart';
import '../presentation.dart';

part './app_routes.dart';

abstract class AppPages {
  static final pages = [
    GetPage(
      name: Routes.LOGINVIEW,
      page: () => const LoginView(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.REGISTERVIEW,
      page: () => const RegisterView(),
    ),
    GetPage(
      name: Routes.HOMEVIEW,
      binding: HomeBinding(),
      page: () => const HomeView(),
    ),
  ];
}
