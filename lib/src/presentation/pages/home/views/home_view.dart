import '../../../../domain/models/role_type_enum.dart';
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
    _homeController.getUSerData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => _homeController.loading.value
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : _pages(_homeController.indexSelcted.value),
      ),
      drawer: HomeDrawer(),
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: ColorApp.white,
        ),
        backgroundColor: ColorApp.black,
        centerTitle: true,
        title: Obx(
          () => _homeController.loading.value
              ? const SizedBox()
              : AutoSizeTextApp(
                  textStyle: StyleText.titleAppbar.copyWith(color: ColorApp.white),
                  title: _homeController.userData.value.rol == RoleType.user ? "Crear solicitud" : "Solicitudes",
                ),
        ),
      ),
    );
  }

  _pages(index) {
    switch (index) {
      case 0:
        return _homeController.userData.value.rol == RoleType.user ? const CreateServiceView() : const RequestView();
      case 1:
        return const CreateServiceView();
      case 2:
        return const RequestView();
    }
  }
}
