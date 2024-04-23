import './register.dart';

class RegisterController extends GetxController {
  static RegisterController get to => Get.find<RegisterController>();
  late final FirebaseServiceUsecase usecase;
  RegisterController({required this.usecase});

  Future<GenericResponse<User>?> register({
    required String email,
    required String password,
  }) async {
    return await usecase.register(email: email, password: password);
  }

  Future<String?> addUser({required UserModelEntitie user}) async {
    return await usecase.addUSerData(user: user);
  }
}
