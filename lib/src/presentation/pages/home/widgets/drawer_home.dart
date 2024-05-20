import '../home.dart';

class HomeDrawer extends StatelessWidget {
  HomeDrawer({super.key});
  final _preferences = LocalPreferences();
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: ColorApp.background,
      child: Column(
        children: [
          Container(
            width: double.maxFinite,
            color: ColorApp.black,
            child: Column(
              children: [
                const SizedBox(height: 48),
                CircleAvatar(
                  radius: 60,
                  backgroundColor: Colors.red,
                  backgroundImage: Image.asset(
                    "assets/logo_app.jpeg",
                  ).image,
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
          _actionDrawer(
            title: "Inicio",
            onTap: () {
              Get.back();
            },
          ),
          const Divider(),
          // _actionDrawer(
          //   title: "Mi perfil",
          //   onTap: () {
          //     HomeViewController.to.indexSelcted.value = 1;
          //     Get.back();
          //   },
          // ),
          // const Divider(),
          _actionDrawer(
            title: "Solicitudes",
            onTap: () {
              Get.back();
            },
          ),
          const Divider(),

          _actionDrawer(
            title: "Biblioteca",
            onTap: () {
              Get.back();
            },
          ),

          const Divider(),
          _actionDrawer(
            title: "Cerrar sesion",
            onTap: () async {
              await _preferences.clearPreferences();
              Get.offAllNamed(Routes.LOGINVIEW);
            },
          ),
        ],
      ),
    );
  }

  Widget _actionDrawer({required String title, required Function() onTap}) {
    return ListTile(
      onTap: onTap,
      title: Text(title, style: StyleText.descriptions),
      trailing: IconButton(
        onPressed: onTap,
        icon: const Icon(
          Icons.arrow_forward_ios_rounded,
          size: 18,
        ),
      ),
    );
  }
}
