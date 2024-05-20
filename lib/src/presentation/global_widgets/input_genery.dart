import 'package:flutter/material.dart';

import '../themes/theme.dart';

class InputGenery extends StatelessWidget {
  const InputGenery({
    super.key,
    this.obscureText,
    this.textInputType,
    this.prefixIcon,
    this.onChanged,
    this.hintText,
    this.isPrefixIcon = false,
    this.suixIcon,
    this.isSufixIcon = false,
    this.controller,
    this.onTap,
    this.colorPrefixIcon,
    this.sizePrefixIcon,
    this.backgroundColor,
    this.minHeight,
    this.maxHeight,
    this.isMultiLinea = false,
    this.colorTextInput,
  });
  final bool isMultiLinea;
  final bool? obscureText;
  final TextInputType? textInputType;
  final IconData? prefixIcon;
  final Function(String)? onChanged;
  final String? hintText;
  final bool isPrefixIcon;
  final Widget? suixIcon;
  final bool isSufixIcon;
  final Color? colorPrefixIcon, backgroundColor, colorTextInput;
  final double? minHeight, sizePrefixIcon, maxHeight;
  final TextEditingController? controller;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      constraints: BoxConstraints(
        maxHeight: maxHeight ?? 50,
        minHeight: minHeight ?? 40,
      ),
      decoration: BoxDecoration(
        color: backgroundColor ?? ColorApp.grey100,
        borderRadius: borderRadius5px,
      ),
      child: TextFormField(
        controller: controller,
        style: StyleText.titleAppbar.copyWith(color: colorTextInput),
        keyboardType: textInputType ?? TextInputType.emailAddress,
        obscureText: obscureText ?? false,
        onTap: onTap,
        onChanged: onChanged,
        cursorColor: ColorApp.blue,
        decoration: InputDecoration(
          hintText: hintText ?? 'Correo',
          hintStyle: StyleText.hintStyle,
          contentPadding: const EdgeInsets.symmetric(horizontal: 20),
          prefixIcon: !isPrefixIcon ? null : Icon(prefixIcon ?? Icons.email_outlined, size: sizePrefixIcon ?? 15),
          prefixIconColor: !isPrefixIcon ? null : colorPrefixIcon ?? ColorApp.blue,
          suffixIcon: suixIcon,
          border: InputBorder.none,
        ),
      ),
    );
  }
}

class InputGeneryAmplio extends StatelessWidget {
  const InputGeneryAmplio({
    super.key,
    this.obscureText,
    this.textInputType,
    this.prefixIcon,
    this.onChanged,
    this.hintText,
    this.suixIcon,
    this.isSufixIcon = false,
    this.controller,
  });

  final bool? obscureText;
  final TextInputType? textInputType;
  final IconData? prefixIcon;
  final Function(String)? onChanged;
  final String? hintText;
  final TextEditingController? controller;

  final Widget? suixIcon;
  final bool isSufixIcon;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorApp.grey100,
      height: 150,
      child: TextFormField(
        controller: controller,
        style: StyleText.titleAppbar,
        keyboardType: textInputType ?? TextInputType.emailAddress,
        obscureText: obscureText ?? false,
        maxLines: 15,
        minLines: 10,
        onChanged: onChanged,
        cursorColor: ColorApp.blue,
        decoration: InputDecoration(
          hintText: hintText ?? 'Correo',
          hintStyle: StyleText.hintStyle,
          contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          border: InputBorder.none,
          suffixIcon: suixIcon,
          label: Text(hintText ?? "Nota", style: StyleText.complementText),
        ),
      ),
    );
  }
}

// class InputGeneryLinear extends StatelessWidget {
//   const InputGeneryLinear({super.key, this.obscureText, this.textInputType, this.onChanged, this.hintText});

//   final bool? obscureText;
//   final TextInputType? textInputType;
//   final Function(String)? onChanged;
//   final String? hintText;
//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: 60,
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           // const Text('Nombre de la tienda', style: bodyTextGreyLight),
//           Flexible(
//             child: TextFormField(
//               style: styleInputsText,
//               keyboardType: textInputType ?? TextInputType.text,
//               obscureText: obscureText ?? false,
//               maxLines: 3,
//               minLines: 1,
//               onChanged: onChanged,
//               cursorColor: colorSecundary,
//               decoration: InputDecoration(
//                 label: Text(hintText!, style: bodyTextGreyLight),
//                 hintText: hintText,
//                 hintStyle: bodyTextGreyLight,
//                 enabledBorder: const UnderlineInputBorder(
//                   borderSide: BorderSide(color: colorBlack12, width: 1),
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

class BtnVisualPassword extends StatefulWidget {
  const BtnVisualPassword({super.key, required this.onValue});
  final Function(bool) onValue;

  @override
  State<BtnVisualPassword> createState() => _BtnVisualPasswordState();
}

class _BtnVisualPasswordState extends State<BtnVisualPassword> {
  bool isOcureText = true;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      splashRadius: 20,
      splashColor: ColorApp.blue.withOpacity(.5),
      tooltip: "visualPasswordBtnText",
      icon: Icon(isOcureText ? Icons.visibility_rounded : Icons.visibility_off_rounded),
      onPressed: () {
        isOcureText = !isOcureText;
        widget.onValue(isOcureText);
        setState(() {});
      },
    );
  }
}

//Cargar el paquete -  pin_code_fields:
// class PinCodeInput extends StatelessWidget {
//   const PinCodeInput({super.key, this.controller});
//   final TextEditingController? controller;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       constraints: const BoxConstraints(maxWidth: 270, minWidth: 255),
//       width: 255,
//       child: PinCodeTextField(
//         appContext: context,
//         length: 4,
//         cursorColor: ColorApp.black,
//         obscureText: false,
//         animationType: AnimationType.fade,
//         textStyle: StyleText.complementText,
//         hintCharacter: "0",
//         hintStyle: StyleText.hintStyle,
//         pinTheme: PinTheme(
//           shape: PinCodeFieldShape.box,
//           inactiveColor: ColorApp.greyLight,
//           activeColor: ColorApp.greyLight,
//           inactiveFillColor: ColorApp.greyLight,
//           disabledColor: ColorApp.greyLight,
//           selectedColor: ColorApp.grey,
//           selectedBorderWidth: 1,
//           selectedFillColor: ColorApp.greyLight,
//           borderRadius: BorderRadius.circular(5),
//           fieldHeight: 40,
//           fieldWidth: 50,
//           activeFillColor: ColorApp.blue,
//         ),
//         animationDuration: const Duration(milliseconds: 450),
//         backgroundColor: ColorApp.background,
//         enableActiveFill: true,
//         controller: controller,
//       ),
//     );
//   }
// }
