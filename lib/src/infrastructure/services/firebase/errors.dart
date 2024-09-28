import 'package:advisor_app/src/domain/domain.dart';

String parseFirebaseAuthException(FirebaseAuthException e) {
  switch (e.code) {
    case 'user-not-found':
      return 'Usuario no encontrado.';
    case 'wrong-password':
      return 'Contraseña incorrecta.';
    case 'email-already-in-use':
      return 'El correo electrónico ya está en uso.';
    case 'invalid-email':
      return 'Correo electrónico inválido.';
    case 'weak-password':
      return 'La contraseña es débil. Debe tener al menos 6 caracteres.';
    case 'invalid-credential':
      return "Correo o contraña incorrectos";
    default:
      return 'Error de autenticación: ${e.message}';
  }
}
