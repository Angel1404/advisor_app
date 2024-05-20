import 'package:advisor_app/src/infrastructure/services/firebase/service_profesional.dart';
import 'package:advisor_app/src/presentation/presentation.dart';

class InitialBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FirebaseAuthService>(() => FirebaseAuthService(), fenix: true);
    Get.lazyPut<FirebaseDBService>(() => FirebaseDBService(), fenix: true);
    Get.lazyPut<ServicesProfesional>(() => ServicesProfesional(), fenix: true);

    Get.lazyPut<FirebaseServiceUsecase>(
        () => FirebaseServiceUsecase(
              firebaseAuthService: FirebaseAuthService.to,
              firebaseDBService: FirebaseDBService.to,
            ),
        fenix: true);

    Get.lazyPut<LoginController>(() => LoginController(usecase: FirebaseServiceUsecase.to), fenix: true);
    //
    Get.lazyPut<RegisterController>(
      () => RegisterController(localPreferences: LocalPreferences(), usecase: FirebaseServiceUsecase.to),
      fenix: true,
    );
    Get.lazyPut<SplashScreenController>(
      () => SplashScreenController(localPreferences: LocalPreferences()),
      fenix: true,
    );
  }
}

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeViewController>(
      () => HomeViewController(
        usecase: FirebaseServiceUsecase.to,
        preferences: LocalPreferences(),
      ),
      fenix: true,
    );
    Get.lazyPut<CreateServiceController>(
      () => CreateServiceController(
        servicesProfesional: ServicesProfesional.to,
        localPreferences: LocalPreferences(),
      ),
      fenix: true,
    );
    Get.lazyPut<RequestController>(
      () => RequestController(
        servicesProfesional: ServicesProfesional.to,
        localPreferences: LocalPreferences(),
      ),
      fenix: true,
    );
  }
}
