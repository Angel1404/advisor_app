import 'package:flutter/material.dart';

import 'colors_app.dart';
import 'input_theme.dart';
import 'style_text_app.dart';

final btnTheme = ElevatedButtonThemeData(
  style: ElevatedButton.styleFrom(
    maximumSize: const Size(320, 50),
    minimumSize: const Size(314, 45),
    backgroundColor: ColorApp.blue,
    elevation: 0,
    textStyle: StyleText.btn,
    shape: RoundedRectangleBorder(borderRadius: borderRadius5px),
    disabledBackgroundColor: ColorApp.blue.withOpacity(.5),
  ),
);

final themeApp = ThemeData(
  scaffoldBackgroundColor: ColorApp.background,
  elevatedButtonTheme: btnTheme,
  fontFamily: "Chivo", //Cambiar el nombre de la fuente segun tengas en el pubspec
  inputDecorationTheme: inputTheme,
);
