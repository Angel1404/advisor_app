import 'package:advisor_app/src/domain/domain.dart';
import 'package:get/get.dart';

class FirebaseAuthService {
  static FirebaseAuthService get to => Get.find<FirebaseAuthService>();

  final FirebaseAuth auth = FirebaseAuth.instance;

  Future<GenericResponse<User>> login({required String email, required String password}) async {
    try {
      final response = await auth.signInWithEmailAndPassword(email: email, password: password);
      if (response.user != null) {
        return GenericResponse(data: response.user);
      }
      return GenericResponse(error: "Error de autenticacion, usuario no encontrado");
    } on FirebaseAuthException catch (e) {
      return GenericResponse(error: parseFirebaseAuthException(e));
    }
  }

  Future<GenericResponse<User>> register({required String email, required String password}) async {
    try {
      final response = await auth.createUserWithEmailAndPassword(email: email, password: password);
      if (response.user != null) {
        return GenericResponse(data: response.user);
      }
      return GenericResponse(error: 'Usuario no registrado');
    } on FirebaseAuthException catch (e) {
      return GenericResponse(error: parseFirebaseAuthException(e));
    }
  }
}
