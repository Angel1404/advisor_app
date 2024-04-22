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
  });
  final Widget? child;
  final bool isScroll;
  final String? titleAppbar;
  final Function()? onPressedAppBar;
  final bool isAppbar;
  final double spacingTop;
  final double heightBody;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorApp.background,
        elevation: 0,
        leading: IconBackAppbar(onPressed: onPressedAppBar),
        title: AutoSizeTextApp(title: titleAppbar ?? "Crear cuenta", textStyle: StyleText.titleAppbar),
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 23),
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
