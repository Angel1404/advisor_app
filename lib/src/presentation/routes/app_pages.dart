import '../../binding/binding_app.dart';
import '../presentation.dart';

part './app_routes.dart';

abstract class AppPages {
  static final pages = [
    GetPage(
      name: Routes.INITIAL,
      page: () => const SplashScreen(),
    ),
    GetPage(
      name: Routes.LOGINVIEW,
      page: () => const LoginView(),
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
    GetPage(
      name: Routes.HOMEVIEW,
      page: () => const RequestView(),
    ),
  ];
}
