import 'package:advisor_app/src/presentation/presentation.dart';
import 'package:flutter/material.dart';

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
  RxBool isPro = false.obs;
  RxBool isUser = false.obs;
  RxBool loading = false.obs;
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

  void register() {
    loading.value = true;
    RegisterController.to
        .register(
            email: _emailController.text.trim(),
            password: _passwordController.text)
        .then((value) {
      if (value != null && value.error != null) {
        loading.value = false;
        AppDialogs.information(title: "Error", description: value.error ?? "");
      } else {
        RegisterController.to
            .addUser(
          user: UserModelEntitie(
            email: _emailController.text,
            id: value?.data?.uid ?? "",
            name: _nameController.text,
            rol: isPro.value == false ? "Usuario" : "Profesional",
            apells: _lastNameController.text,
            phone: _phoneController.text.trim(),
          ),
        )
            .then((addValue) {
          if (value != "success") {
            loading.value = false;
            AppDialogs.information(title: "Error", description: addValue ?? "");
          } else {
            loading.value = false;
            print("success");
          }
        });
      }
      loading.value = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => BodyTemplate(
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
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Row(
                    children: [
                      Flexible(
                        child: InputGenery(
                            controller: _nameController, hintText: "Nombres"),
                      ),
                      const SizedBox(width: 8),
                      Flexible(
                        child: InputGenery(
                            controller: _lastNameController,
                            hintText: "Apellidos"),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                InputGenery(hintText: "Teléfono", controller: _phoneController),
                const SizedBox(height: 10),
                InputGenery(controller: _emailController),
                const SizedBox(height: 10),
                InputGenery(
                  hintText: "Contraseña",
                  suixIcon: BtnVisualPassword(onValue: (value) {}),
                  controller: _passwordController,
                ),
                const SizedBox(height: 10),
                CheckTitle(
                  title: "Usuario",
                  isRinchTitle: false,
                  value: isUser.value,
                  onChange: (p0) {
                    isPro.value = false;
                    isUser.value = p0!;
                  },
                ),
                CheckTitle(
                  onChange: (p0) {
                    isPro.value = p0!;
                    isUser.value = false;
                  },
                  isRinchTitle: false,
                  value: isPro.value,
                  title: "Profesional",
                ),
                const SizedBox(height: 40),
                loading.value == true
                    ? const CircularProgressIndicator.adaptive()
                    : BtnApp(
                        titleBtn: "Siguiente",
                        onPressed: () {
                          register();
                        },
                      ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
