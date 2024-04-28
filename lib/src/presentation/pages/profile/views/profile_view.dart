import '../profile.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return BodyTemplate(
      spacingTop: .01,
      isAppbar: false,
      titleAppbar: 'Perfil',
      heightBody: .73,
      isScroll: true,
      child: Column(
        children: [
          const Text(
            "Tu perfil",
            style: StyleText.titleAppbar,
          ),
          const SizedBox(height: 64),
          const FormProfileContent(),
          const SizedBox(height: 44),
          BtnApp(
            width: 100,
            height: 45,
            onPressed: () {},
            titleBtn: 'Guardar cambios',
          ),
        ],
      ),
    );
  }
}
