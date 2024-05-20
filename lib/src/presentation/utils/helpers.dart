import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

void openWhatsApp({required String phoneNumber}) async {
  if (phoneNumber.isEmpty) return;
  final number = phoneNumber.contains("+") ? phoneNumber.split("+").last : phoneNumber;
  String url = "";

  if (GetPlatform.isAndroid) {
    url = "whatsapp://send?phone=57$number";
  } else {
    url = "https://api.whatsapp.com/send?phone=57$number";
  }
  try {
    await launchUrl(Uri.parse(url));
  } catch (e) {
    throw "No se pudo abrir la aplicación de WhatsApp";
  }
}
