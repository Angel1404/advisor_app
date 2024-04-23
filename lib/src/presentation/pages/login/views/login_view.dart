import 'package:advisor_app/src/presentation/presentation.dart';
import 'package:flutter/material.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;
  RxBool loading = false.obs;
  RxBool hidePassword = false.obs;
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

  void logIn() {
    loading.value = true;
    LoginController.to
        .login(
            email: _emailController.text.trim(),
            password: _passwordController.text)
        .then((value) async {
      await Future.delayed(const Duration(seconds: 2));
      loading.value = false;
      if (value != null && value.error != null) {
        AppDialogs.information(title: "Error", description: value.error ?? "");
      } else {
        Get.offAndToNamed(Routes.HOMEVIEW);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => BodyTemplate(
        isAppbar: false,
        isScroll: true,
        heightBody: .75,
        spacingTop: .05,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //LOGO
            const SizedBox(height: 35),

            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                InputGenery(controller: _emailController),
                const SizedBox(height: 10),
                InputGenery(
                  hintText: "Contraseña",
                  obscureText: hidePassword.value,
                  suixIcon: BtnVisualPassword(
                    onValue: (value) {
                      hidePassword.value = value;
                    },
                  ),
                  controller: _passwordController,
                ),
                const SizedBox(height: 15),
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
