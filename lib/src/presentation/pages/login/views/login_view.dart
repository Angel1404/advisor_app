import 'package:advisor_app/src/presentation/presentation.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;
  RxBool loading = false.obs;
  RxBool hidePassword = true.obs;
  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();

    super.dispose();
  }

  void logIn() async {
    loading.value = true;
    final response = await LoginController.to.login(email: _emailController.text.trim(), password: _passwordController.text);
    loading.value = false;
    if (response.error != null) {
      AppDialogs.information(title: "Error", description: response.error ?? "");
      return;
    }
    Get.offAndToNamed(Routes.HOMEVIEW);
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => BodyTemplate(
        backgroundColorSF: ColorApp.black,
        isAppbar: false,
        isScroll: true,
        heightBody: .75,
        spacingTop: .05,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const LogoAppCard(),
            const SizedBox(height: 35),
            const Text(
              "Login",
              style: StyleText.titleAppbar,
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                InputGenery(
                  colorTextInput: ColorApp.white,
                  controller: _emailController,
                  backgroundColor: ColorApp.white.withOpacity(.2),
                ),
                const SizedBox(height: 10),
                InputGenery(
                  colorTextInput: ColorApp.white,
                  backgroundColor: ColorApp.white.withOpacity(.2),
                  hintText: "Contraseña",
                  obscureText: hidePassword.value,
                  suixIcon: BtnVisualPassword(
                    onValue: (value) {
                      hidePassword.value = value;
                    },
                  ),
                  controller: _passwordController,
                ),
                const SizedBox(height: 25),
                loading.value == true
                    ? const CircularProgressIndicator.adaptive()
                    : BtnApp(
                        titleBtn: "Ingresar",
                        onPressed: () {
                          logIn();
                        },
                      ),
                const SizedBox(height: 15),
                const AutoSizeTextApp(title: "¿Has olvidado tu contraseña?"),
              ],
            ),
            BtnApp(
              titleBtn: "Crea una cuenta",
              onPressed: () {
                Get.toNamed(Routes.REGISTERVIEW);
              },
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
