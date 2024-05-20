import 'package:advisor_app/src/presentation/presentation.dart';

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

  void register() async {
    await AppDialogs.information(title: "Rol", description: "Si no escogiste un rol, por derecto será: Usuario");

    loading.value = true;
    final response = await RegisterController.to.register(
      email: _emailController.text.trim(),
      password: _passwordController.text,
      isPro: isPro.value,
      lastname: _lastNameController.text,
      name: _nameController.text,
      phone: _phoneController.text,
    );
    loading.value = false;

    if (response.error != null) {
      AppDialogs.information(title: "Error", description: response.error ?? "");
      return;
    }
    Get.offAndToNamed(Routes.HOMEVIEW);
  }

  final hidePassword = true.obs;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => BodyTemplate(
        backgroundColorSF: ColorApp.black,
        backgroundColorAB: ColorApp.black,
        colorIconBack: ColorApp.white,
        colorTextAppBar: ColorApp.white,
        isScroll: true,
        spacingTop: .03,
        heightBody: .73,
        child: Column(
          children: [
            const LogoAppCard(),
            const SizedBox(height: 35),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    Flexible(
                      child: InputGenery(
                          colorTextInput: ColorApp.white,
                          backgroundColor: ColorApp.white.withOpacity(.2),
                          controller: _nameController,
                          hintText: "Nombres"),
                    ),
                    const SizedBox(width: 8),
                    Flexible(
                      child: InputGenery(
                          colorTextInput: ColorApp.white,
                          backgroundColor: ColorApp.white.withOpacity(.2),
                          controller: _lastNameController,
                          hintText: "Apellidos"),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                InputGenery(
                  colorTextInput: ColorApp.white,
                  backgroundColor: ColorApp.white.withOpacity(.2),
                  hintText: "Teléfono",
                  controller: _phoneController,
                  textInputType: TextInputType.number,
                ),
                const SizedBox(height: 10),
                InputGenery(colorTextInput: ColorApp.white, backgroundColor: ColorApp.white.withOpacity(.2), controller: _emailController),
                const SizedBox(height: 10),
                Obx(() => InputGenery(
                      colorTextInput: ColorApp.white,
                      backgroundColor: ColorApp.white.withOpacity(.2),
                      obscureText: hidePassword.value,
                      hintText: "Contraseña",
                      suixIcon: BtnVisualPassword(
                        onValue: (value) {
                          hidePassword.value = value;
                        },
                      ),
                      controller: _passwordController,
                    )),
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
                        titleBtn: "Crear cuenta",
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
