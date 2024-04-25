import './home.dart';

class HomeViewController extends GetxController {
  static HomeViewController get to => Get.find<HomeViewController>();

  RxInt indexSelcted = 0.obs;
}
