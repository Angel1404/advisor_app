import 'package:flutter/material.dart';

import '../../../global_widgets/global_widgets.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  late final TextEditingController _nameController;
  late final TextEditingController _lastNameController;
  late final TextEditingController _codePhoneController;
  late final TextEditingController _phoneController;
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _lastNameController = TextEditingController();
    _codePhoneController = TextEditingController();
    _phoneController = TextEditingController();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _lastNameController.dispose();
    _codePhoneController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    _passwordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BodyTemplate(
      isScroll: true,
      spacingTop: .05,
      heightBody: .73,
      child: Column(
        children: [
          //LOGO
          const SizedBox(height: 35),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  Flexible(
                    child: InputGenery(controller: _nameController, hintText: "Nombres"),
                  ),
                  const SizedBox(width: 8),
                  Flexible(
                    child: InputGenery(controller: _lastNameController, hintText: "Apellidos"),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Flexible(
                    child: InputGenery(
                      hintText: "+57",
                      controller: _codePhoneController,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Flexible(
                    flex: 3,
                    child: InputGenery(hintText: "Teléfono", controller: _phoneController),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              InputGenery(controller: _emailController),
              const SizedBox(height: 10),
              InputGenery(
                hintText: "Contraseña",
                suixIcon: BtnVisualPassword(onValue: (value) {}),
                controller: _passwordController,
              ),
              const SizedBox(height: 10),
              CheckTitle(onChange: (p0) {}),
              const SizedBox(height: 10),
              CheckTitle(onChange: (p0) {}, title: "He leído y acepto la ", rinchTitle: "Ley de Proteccion de datos."),
              const SizedBox(height: 40),
              BtnApp(titleBtn: "Siguiente", onPressed: () {}),
            ],
          ),
        ],
      ),
    );
  }
}
