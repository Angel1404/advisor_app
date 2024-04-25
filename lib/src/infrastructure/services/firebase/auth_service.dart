import 'package:advisor_app/src/domain/domain.dart';

class FirebaseAuthService {
  final FirebaseAuth auth = FirebaseAuth.instance;

  Future<GenericResponse<User>?> login({
    required String email,
    required String password,
  }) async {
    try {
      await auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) {
        if (value.user != null && value.user!.email != null) {
          return GenericResponse(data: value.user);
        }
      });
    } on FirebaseAuthException catch (e) {
      return GenericResponse(error: parseFirebaseAuthException(e));
    }
    return null;
  }

  Future<GenericResponse<User>?> register({
    required String email,
    required String password,
  }) async {
    late GenericResponse<User> response;
    try {
      await auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) {
        if (value.user != null && value.user!.email != null) {
          response = GenericResponse(data: value.user);
        } else {
          response = GenericResponse(error: 'nada');
        }
      });
    } on FirebaseAuthException catch (e) {
      response = GenericResponse(error: parseFirebaseAuthException(e));
    }
    return response;
  }
}
