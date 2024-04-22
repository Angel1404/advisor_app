import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../themes/theme.dart';
import 'global_widgets.dart';

class BtnApp extends StatelessWidget {
  const BtnApp({
    super.key,
    this.onPressed,
    this.titleBtn,
    this.backgroundColor,
  });

  final String? titleBtn;
  final Function()? onPressed;
  final Color? backgroundColor;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(backgroundColor: backgroundColor),
      child: AutoSizeTextApp(
        title: titleBtn ?? "Iniciar sesion",
        maxLines: 1,
        textStyle: StyleText.btn,
      ),
    );
  }
}

class BtnAppOutline extends StatelessWidget {
  const BtnAppOutline({
    super.key,
    this.onPressed,
    this.titleBtn,
    this.isBorderRadius = true,
    this.icon,
  });

  final String? titleBtn;
  final Function()? onPressed;
  final bool isBorderRadius;
  final Widget? icon;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: ColorApp.background,
        shape: RoundedRectangleBorder(
          borderRadius: isBorderRadius ? BorderRadius.circular(8) : BorderRadius.zero,
          side: const BorderSide(color: ColorApp.blue),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AutoSizeTextApp(
            title: titleBtn ?? "iniciarSesionText",
            maxLines: 1,
            textStyle: StyleText.btn,
          ),
          if (icon != null) ...[const SizedBox(width: 10), icon!],
        ],
      ),
    );
  }
}

//Quitar Get.back(), que es del paquete y navegacion de get:
class IconBackAppbar extends StatelessWidget {
  const IconBackAppbar({
    super.key,
    this.onPressed,
  });
  final Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    //TODO: Colocar navigatorBack si el onpressed es null ??
    return IconButton(
      onPressed: onPressed ?? () => Get.back(),
      icon: const Icon(
        Icons.arrow_back_ios_outlined,
        color: ColorApp.black,
        size: 22,
      ),
    );
  }
}
