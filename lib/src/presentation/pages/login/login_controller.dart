import 'package:advisor_app/src/presentation/pages/login/login.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  static LoginController get to => Get.find<LoginController>();
  late final FirebaseServiceUsecase usecase;
  LoginController({required this.usecase});

  Future<GenericResponse<User>?> login({
    required String email,
    required String password,
  }) async {
    return await usecase.login(email: email, password: password);
  }

  Future<GenericResponse<User>?> register({
    required String email,
    required String password,
  }) async {
    return await usecase.login(email: email, password: password);
  }

  Future<String?> addUser({required UserModelEntitie user}) async {
    return await usecase.addUSerData(user: user);
  }
}
