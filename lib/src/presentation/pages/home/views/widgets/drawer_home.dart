import '../../home.dart';

class HomeDrawer extends StatelessWidget {
  HomeDrawer({super.key});
  final _preferences = LocalPreferences();
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: ColorApp.background,
      child: Column(
        children: [
          const SizedBox(height: 48),
          const CircleAvatar(
            radius: 60,
            backgroundColor: Colors.red,
          ),
          const Divider(),
          _actionDrawer(
              title: "Mi perfil",
              onTap: () {
                HomeViewController.to.indexSelcted.value = 1;
                Get.back();
              }),
          const Divider(),
          _actionDrawer(
              title: "Solicitudes",
              onTap: () {
                HomeViewController.to.indexSelcted.value = 2;
                Get.back();
              }),
          const Divider(),
          _actionDrawer(
              title: "Cerrar sesion",
              onTap: () {
                _preferences.logIn = false;
                Get.offAllNamed(Routes.LOGINVIEW);
              }),
        ],
      ),
    );
  }

  Widget _actionDrawer({required String title, required Function() onTap}) {
    return ListTile(
      onTap: onTap,
      title: Text(title),
    );
  }
}
