import 'package:advisor_app/src/domain/domain.dart';
import 'package:get/get.dart';

class FirebaseDBService {
  static FirebaseDBService get to => Get.find<FirebaseDBService>();

  final users = FirebaseFirestore.instance.collection('users');
  Future<Map<String, dynamic>> getUserData({required String id}) async {
    try {
      final snapshot = await users.doc(id).get();

      return snapshot.data() ?? {};
    } catch (e) {
      throw e.toString();
    }
  }

  Future<String?> addUserData({required UserModelEntitie user}) async {
    try {
      await users.doc(user.id).set(user.toJson());
      return 'success';
    } catch (e) {
      return 'Error al obtener los datos del usuario: $e';
    }
  }
}
