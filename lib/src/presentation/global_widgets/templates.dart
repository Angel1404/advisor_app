import 'package:flutter/material.dart';

import '../themes/theme.dart';
import 'global_widgets.dart';

class BodyTemplate extends StatelessWidget {
  const BodyTemplate({
    super.key,
    this.child,
    this.isScroll = false,
    this.titleAppbar,
    this.onPressedAppBar,
    this.isAppbar = true,
    this.spacingTop = .1,
    this.heightBody = .55,
    this.paddingBody,
    this.backgroundColorSF,
    this.backgroundColorAB,
    this.colorTextAppBar,
    this.colorIconBack,
  });
  final Widget? child;
  final bool isScroll;
  final String? titleAppbar;
  final Function()? onPressedAppBar;
  final bool isAppbar;
  final double spacingTop;
  final double heightBody;
  final Color? backgroundColorSF, backgroundColorAB, colorTextAppBar, colorIconBack;
  final EdgeInsetsGeometry? paddingBody;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: backgroundColorSF,
      appBar: isAppbar == false
          ? null
          : AppBar(
              backgroundColor: backgroundColorAB ?? ColorApp.background,
              elevation: 0,
              leading: IconBackAppbar(
                onPressed: onPressedAppBar,
                colorIcon: colorIconBack,
              ),
              title: AutoSizeTextApp(
                title: titleAppbar ?? "Crear cuenta",
                textStyle: StyleText.titleAppbar.copyWith(color: colorTextAppBar),
              ),
            ),
      body: Container(
        padding: paddingBody,
        margin: const EdgeInsets.symmetric(horizontal: 16),
        height: size.height,
        width: size.width,
        child: isScroll
            ? SingleChildScrollView(
                padding: const EdgeInsets.symmetric(vertical: 25),
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    SizedBox(height: size.height * spacingTop),
                    SizedBox(width: double.maxFinite, height: size.height * heightBody, child: child),
                  ],
                ),
              )
            : child,
      ),
    );
  }
}
