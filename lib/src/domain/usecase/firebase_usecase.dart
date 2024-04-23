import 'package:advisor_app/src/domain/domain.dart';

class FirebaseServiceUsecase {
  final FirebaseAuthService? firebaseAuthService;
  final FirebaseDBService? firebaseDBService;
  FirebaseServiceUsecase({this.firebaseAuthService, this.firebaseDBService});

  Future<GenericResponse<User>?> login({
    required String email,
    required String password,
  }) async {
    if (firebaseAuthService != null) {
      return firebaseAuthService!.login(email: email, password: password);
    }
    return GenericResponse(error: 'No esta inyectando el servicio necesario');
  }

  Future<GenericResponse<User>?> register({
    required String email,
    required String password,
  }) async {
    if (firebaseAuthService != null) {
      return firebaseAuthService!.register(email: email, password: password);
    }
    return GenericResponse(error: 'No esta inyectando el servicio necesario');
  }

  Future<GenericResponse<UserModelEntitie>?> getUserData({
    required String id,
  }) async {
    if (firebaseDBService != null) {
      return firebaseDBService!.getUserData(id: id);
    }
    return GenericResponse(error: 'No esta inyectando el servicio necesario');
  }

  Future<String?> addUSerData({
    required UserModelEntitie user,
  }) async {
    if (firebaseDBService != null) {
      return firebaseDBService!.addUserData(user: user);
    }
    return 'No esta inyectando el servicio necesario';
  }
}
