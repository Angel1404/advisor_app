import './home.dart';

class HomeViewController extends GetxController {
  static HomeViewController get to => Get.find<HomeViewController>();
  late final FirebaseServiceUsecase usecase;
  late final LocalPreferences preferences;
  HomeViewController({required this.usecase, required this.preferences});

  RxInt indexSelcted = 0.obs;
  RxBool loading = true.obs;
  final userData = UserModelEntitie().obs;

  Future getUSerData() async {
    try {
      loading.value = true;
      final response = await usecase.firebaseDBService.getUserData(id: preferences.getUserId!);
      if (response.isNotEmpty) {
        final user = UserModelEntitie.fromJson(response);
        userData.value = user;
        preferences.setUserRole = user.rol.role;
        preferences.setUserName = "${user.name} ${user.apells}";
      }
      loading.value = false;
    } catch (e) {
      loading.value = false;

      debugPrint(e.toString());
    }
  }
}
