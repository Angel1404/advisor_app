import 'package:advisor_app/src/domain/domain.dart';
import 'package:get/get.dart';

class FirebaseServiceUsecase {
  static FirebaseServiceUsecase get to => Get.find<FirebaseServiceUsecase>();
  final FirebaseAuthService firebaseAuthService;
  final FirebaseDBService firebaseDBService;
  FirebaseServiceUsecase({required this.firebaseAuthService, required this.firebaseDBService});

  Future<GenericResponse<User>> login({
    required String email,
    required String password,
  }) async {
    return firebaseAuthService.login(email: email, password: password);
  }

  Future<GenericResponse<User>> register({
    required String email,
    required String password,
  }) async {
    return firebaseAuthService.register(email: email, password: password);
  }

  Future<Map<String, dynamic>> getUserData({
    required String id,
  }) async {
    try {
      return firebaseDBService.getUserData(id: id);
    } catch (e) {
      throw e.toString();
    }
  }

  Future<String?> addUSerData({
    required UserModelEntitie user,
  }) async {
    try {
      return firebaseDBService.addUserData(user: user);
    } catch (e) {
      throw e.toString();
    }
  }
}
