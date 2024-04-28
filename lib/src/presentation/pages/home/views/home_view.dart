import '../home.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final _homeController = HomeViewController.to;
  @override
  void initState() {
    _homeController.preferences.logIn = true;
    _homeController.getUSerData().then((value) {
      if (value != "success") {
        AppDialogs.information(
            isError: true,
            title: "Errror en obtener datos de usuario",
            description: "$value");
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => _homeController.loading.value == true
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : _pages(_homeController.indexSelcted.value),
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
        return _homeController.userData.value.rol.toLowerCase() == "usuario"
            ? const RequestView()
            : const ProfileView();
      case 1:
        return const ProfileView();
      case 2:
        return const RequestView();
    }
  }
}
