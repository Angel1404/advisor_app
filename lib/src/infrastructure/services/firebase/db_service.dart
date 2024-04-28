import 'package:advisor_app/src/domain/domain.dart';

class FirebaseDBService {
  final users = FirebaseFirestore.instance.collection('users');
  Future<GenericResponse<UserModelEntitie>?> getUserData({
    required String id,
  }) async {
    try {
      DocumentSnapshot snapshot = await users.doc(id).get();
      if (snapshot.exists) {
        UserModelEntitie userData = UserModelEntitie.fromJson(
          snapshot.data() as Map<String, dynamic>,
        );
        return GenericResponse<UserModelEntitie>(data: userData);
      } else {
        return GenericResponse(
          error: 'El usuario no fue encontrado.',
        );
      }
    } catch (e) {
      return GenericResponse<UserModelEntitie>(
        error: 'Error al obtener los datos del usuario: $e',
      );
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
