import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';

import '../themes/theme.dart';

//Cargar el paquete -  auto_size_text:
class AutoSizeTextApp extends StatelessWidget {
  const AutoSizeTextApp({super.key, required this.title, this.textStyle, this.textAlign, this.minFontSize, this.maxLines, this.fontSize});
  final String title;
  final TextStyle? textStyle;
  final TextAlign? textAlign;
  final double? minFontSize;
  final int? maxLines;
  final double? fontSize;
  @override
  Widget build(BuildContext context) {
    return AutoSizeText(
      title,
      style: textStyle ?? StyleText.complementText,
      softWrap: true,
      maxLines: maxLines ?? 3,
      textAlign: textAlign ?? TextAlign.center,
      minFontSize: minFontSize ?? 10,
      stepGranularity: minFontSize ?? 10,
      overflow: TextOverflow.ellipsis,
    );
  }
}

class RinchAutosizeText extends StatelessWidget {
  const RinchAutosizeText({
    super.key,
    required this.title,
    required this.rinchTitle,
    this.textStyle,
    this.textAlign,
    this.minFontSize,
    this.maxLines,
    this.fontSize,
    this.rinchTextStyle,
  });
  final String title;
  final String rinchTitle;
  final TextStyle? textStyle;
  final TextStyle? rinchTextStyle;
  final TextAlign? textAlign;
  final double? minFontSize;
  final int? maxLines;
  final double? fontSize;
  @override
  Widget build(BuildContext context) {
    return AutoSizeText.rich(
      TextSpan(
        text: title,
        children: [
          TextSpan(
            text: rinchTitle,
            style: rinchTextStyle,
          ),
        ],
      ),
      style: textStyle ?? StyleText.complementText,
      softWrap: true,
      maxLines: maxLines ?? 3,
      textAlign: textAlign ?? TextAlign.center,
      minFontSize: minFontSize ?? 10,
      stepGranularity: minFontSize ?? 10,
      overflow: TextOverflow.ellipsis,
    );
  }
}
