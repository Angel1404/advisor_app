import '../home.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final _instance = Get.put(HomeViewController());
  final _preferences = LocalPreferences();
  @override
  void initState() {
    _preferences.logIn = true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => _pages(HomeViewController.to.indexSelcted.value),
      ),
      drawer: HomeDrawer(),
      appBar: AppBar(
        backgroundColor: ColorApp.background,
      ),
    );
  }

  _pages(index) {
    switch (index) {
      case 0:
        return const Placeholder();
      case 1:
        return const ProfileView();
      case 2:
        return const RequestView();
    }
  }
}
