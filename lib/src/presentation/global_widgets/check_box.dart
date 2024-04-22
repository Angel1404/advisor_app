import 'package:flutter/material.dart';

import '../themes/theme.dart';
import 'global_widgets.dart';

class CheckTitle extends StatelessWidget {
  const CheckTitle({
    super.key,
    this.onTap,
    this.title,
    this.rinchTitle,
    this.isReserveCheck = false,
    required this.onChange,
    this.isRinchTitle = true,
    this.child,
  });

  final Function()? onTap;

  final String? title;

  final String? rinchTitle;

  final bool isReserveCheck;
  final bool isRinchTitle;

  final Function(bool?) onChange;
  final Widget? child;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        if (!isReserveCheck) CkeckList(onChange: onChange),
        Flexible(
          child: InkWell(
            onTap: onTap,
            child: RinchAutosizeText(
              textAlign: TextAlign.start,
              title: title ?? "He leído, he entendido y acepto los ",
              rinchTitle: isRinchTitle == true ? rinchTitle ?? "Términos y Condiciones." : "",
              rinchTextStyle: StyleText.complementTextBlue.copyWith(decoration: TextDecoration.underline),
            ),
          ),
        ),
        if (isReserveCheck) child ?? CkeckList(onChange: onChange),
      ],
    );
  }
}

class CkeckList extends StatefulWidget {
  const CkeckList({
    super.key,
    required this.onChange,
  });
  final Function(bool?) onChange;

  @override
  State<CkeckList> createState() => _CkeckListState();
}

class _CkeckListState extends State<CkeckList> {
  bool isSeleted = false;

  @override
  Widget build(BuildContext context) {
    return Checkbox.adaptive(
      activeColor: ColorApp.blue,
      value: isSeleted,
      onChanged: (value) {
        setState(() {
          isSeleted = value ?? false;
        });
        widget.onChange(value);
      },
    );
  }
}
