import 'package:get/get.dart';

import '../../../infrastructure/infrastructure.dart';
import '../../routes/app_pages.dart';

class SplashScreenController extends GetxController {
  final LocalPreferences _localPreferences;

  SplashScreenController({required LocalPreferences localPreferences}) : _localPreferences = localPreferences;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    validateCurrentUser();
  }

  validateCurrentUser() async {
    await 1.5.delay();
    final String? idUser = await _localPreferences.getUserId;
    if (idUser != null && idUser.isNotEmpty) {
      Get.offNamed(Routes.HOMEVIEW);
      return;
    }
    Get.offNamed(Routes.LOGINVIEW);
  }
}
