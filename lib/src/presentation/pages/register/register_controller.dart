import '../../../infrastructure/infrastructure.dart';
import './register.dart';

class RegisterController extends GetxController {
  static RegisterController get to => Get.find<RegisterController>();
  late final FirebaseServiceUsecase usecase;
  final LocalPreferences localPreferences;
  RegisterController({required this.usecase, required this.localPreferences});

  Future<GenericResponse> register({
    required String email,
    required String password,
    required String name,
    required String lastname,
    required String phone,
    required bool isPro,
  }) async {
    if (phone.length < 10 || phone.length > 11 || phone.isEmpty) {
      return GenericResponse(error: "Número de télefono incorrecto");
    }
    if (name.isEmpty) {
      return GenericResponse(error: "Tu(s) nombre(s) es/son requerido(s)");
    }
    if (lastname.isEmpty) {
      return GenericResponse(error: "Tu(s) apellido(s) es/son requerido(s)");
    }
    final response = await usecase.register(email: email, password: password);
    if (response.error != null) {
      return response;
    }
    final user = UserModelEntitie(
      email: email,
      id: response.data?.uid ?? "",
      name: name,
      rol: isPro == false ? RoleType.user : RoleType.profesional,
      apells: lastname,
      phone: phone.trim(),
    );
    return addUser(user);
  }

  Future<GenericResponse> addUser(UserModelEntitie user) async {
    final response = await usecase.addUSerData(user: user);
    if (response != "success") {
      return GenericResponse(error: response);
    }
    localPreferences.setUserId = user.id;
    return GenericResponse();
  }
}
