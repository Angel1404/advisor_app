import 'package:advisor_app/src/presentation/pages/home/home.dart';

class TextInformation extends StatelessWidget {
  const TextInformation({
    super.key,
    required this.text,
    required this.color,
    required this.title,
  });
  final String text, title;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: RinchAutosizeText(
        rinchTitle: text,
        title: title,
        textAlign: TextAlign.start,
        textStyle: StyleText.titleAppbar.copyWith(fontWeight: FontWeight.w500),
        rinchTextStyle: StyleText.complementText.copyWith(color: ColorApp.black),
      ),
    );
  }
}
