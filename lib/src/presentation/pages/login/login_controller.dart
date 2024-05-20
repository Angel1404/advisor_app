import 'package:advisor_app/src/presentation/pages/login/login.dart';
import 'package:get/get.dart';

import '../../../infrastructure/infrastructure.dart';

class LoginController extends GetxController {
  static LoginController get to => Get.find<LoginController>();
  late final FirebaseServiceUsecase usecase;
  LoginController({required this.usecase});

  Future<GenericResponse> login({
    required String email,
    required String password,
  }) async {
    final response = await usecase.login(email: email, password: password);
    if (response.error != null) {
      return response;
    }
    LocalPreferences().setUserId = response.data!.uid;

    return response;
  }

  Future<GenericResponse<User>?> register({
    required String email,
    required String password,
  }) async {
    return await usecase.login(email: email, password: password);
  }

  Future<String?> addUser({required UserModelEntitie user}) async {
    try {
      final response = await usecase.addUSerData(user: user);
      return response;
    } catch (e) {
      return null;
    }
  }
}
