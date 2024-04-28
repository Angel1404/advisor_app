import './home.dart';

class HomeViewController extends GetxController {
  static HomeViewController get to => Get.find<HomeViewController>();
  late final FirebaseServiceUsecase usecase;
  late final LocalPreferences preferences;
  HomeViewController({required this.usecase, required this.preferences});

  RxInt indexSelcted = 0.obs;
  RxBool loading = true.obs;
  final userData = UserModelEntitie().obs;

  Future<String?> getUSerData() {
    return usecase.firebaseDBService!
        .getUserData(id: preferences.getUserId)
        .then(
      (value) {
        loading.value = false;
        if (value != null && value.error != null) {
          return value.error;
        } else {
          userData.value = value!.data!;
          return 'success';
        }
      },
    );
  }
}
