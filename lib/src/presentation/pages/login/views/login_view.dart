import 'package:flutter/material.dart';

import '../../../global_widgets/global_widgets.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;

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

  @override
  Widget build(BuildContext context) {
    return BodyTemplate(
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
                suixIcon: BtnVisualPassword(onValue: (value) {}),
                controller: _passwordController,
              ),
              const SizedBox(height: 15),
              BtnApp(titleBtn: "Ingresar", onPressed: () {}),
              const SizedBox(height: 15),
              const AutoSizeTextApp(title: "¿Has olvidado tu contraseña?"),
            ],
          ),

          //TODO: Colocar redireccion a Registro
          const BtnApp(titleBtn: "Crea una cuenta", onPressed: null),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
