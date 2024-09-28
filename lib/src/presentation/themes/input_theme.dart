import 'package:flutter/material.dart';

import 'colors_app.dart';
import 'style_text_app.dart';

final inputTheme = InputDecorationTheme(
  border: InputBorder.none,
  hintStyle: StyleText.hintStyle,
  enabledBorder: OutlineInputBorder(
    borderRadius: borderRadius5px,
    borderSide: BorderSide.none,
  ),
  focusedBorder: OutlineInputBorder(
    borderRadius: borderRadius5px,
    borderSide: const BorderSide(color: ColorApp.blue),
  ),
);

//Data General
final borderRadius5px = BorderRadius.circular(5);
