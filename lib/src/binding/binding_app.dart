import 'package:advisor_app/src/presentation/presentation.dart';

class InitialBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(
      () => LoginController(
        usecase: FirebaseServiceUsecase(
          firebaseAuthService: FirebaseAuthService(),
          firebaseDBService: FirebaseDBService(),
        ),
      ),
      fenix: true,
    );
    //
    Get.lazyPut<RegisterController>(
      () => RegisterController(
        usecase: FirebaseServiceUsecase(
          firebaseAuthService: FirebaseAuthService(),
          firebaseDBService: FirebaseDBService(),
        ),
      ),
      fenix: true,
    );
  }
}

class AuthBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(
      () => LoginController(
        usecase: FirebaseServiceUsecase(
          firebaseAuthService: FirebaseAuthService(),
          firebaseDBService: FirebaseDBService(),
        ),
      ),
      fenix: true,
    );
  }
}
