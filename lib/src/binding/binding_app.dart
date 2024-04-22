import 'package:advisor_app/src/presentation/presentation.dart';
import 'package:get/get.dart';

class InitialBinding implements Bindings {
  @override
  void dependencies() {}
}

class AuthBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(() => LoginController(), fenix: true);
    Get.lazyPut<RegisterController>(() => RegisterController(), fenix: true);
  }
}
