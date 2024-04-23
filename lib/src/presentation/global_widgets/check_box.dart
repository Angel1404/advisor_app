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
    this.value = false,
    this.isRinchTitle = true,
    this.child,
  });

  final Function()? onTap;

  final String? title;

  final String? rinchTitle;

  final bool isReserveCheck;
  final bool isRinchTitle;
  final bool value;

  final Function(bool?) onChange;
  final Widget? child;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        if (!isReserveCheck) CkeckList(onChange: onChange, value: value),
        Flexible(
          child: InkWell(
            onTap: onTap,
            child: RinchAutosizeText(
              textAlign: TextAlign.start,
              title: title ?? "He leído, he entendido y acepto los ",
              rinchTitle: isRinchTitle == true
                  ? rinchTitle ?? "Términos y Condiciones."
                  : "",
              rinchTextStyle: StyleText.complementTextBlue
                  .copyWith(decoration: TextDecoration.underline),
            ),
          ),
        ),
        if (isReserveCheck)
          child ?? CkeckList(onChange: onChange, value: value),
      ],
    );
  }
}

class CkeckList extends StatefulWidget {
  const CkeckList({
    Key? key,
    required this.onChange,
    this.value = false,
  }) : super(key: key);

  final Function(bool) onChange;
  final bool value;

  @override
  State<CkeckList> createState() => _CkeckListState();
}

class _CkeckListState extends State<CkeckList> {
  late bool _checked;

  @override
  void initState() {
    super.initState();
    _checked = widget.value;
  }

  @override
  void didUpdateWidget(covariant CkeckList oldWidget) {
    if (oldWidget.value != widget.value) {
      _checked = widget.value;
      setState(() {});
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return Checkbox.adaptive(
      activeColor: ColorApp.blue,
      value: _checked,
      onChanged: (newValue) {
        setState(() {
          _checked = newValue!;
        });
        widget.onChange(newValue!);
      },
    );
  }
}
