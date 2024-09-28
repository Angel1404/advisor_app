import 'package:advisor_app/src/presentation/pages/pages.dart';

class OfferWidget extends StatelessWidget {
  const OfferWidget({super.key, required this.offerText, required this.fee});
  final TextEditingController offerText;
  final double fee;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      child: Column(
        children: [
          const AutoSizeTextApp(
            title: "Escribe una oferta atractiva para el cliente",
            textStyle: StyleText.titleAppbar,
          ),
          const SizedBox(height: 10),
          AutoSizeTextApp(
            title: "Oferta actual por el cliente: $fee",
            textStyle: StyleText.complementText.copyWith(color: ColorApp.black.withOpacity(.7)),
          ),
          const SizedBox(height: 15),
          InputGenery(
            isMultiLinea: false,
            hintText: 'Oferta ',
            backgroundColor: ColorApp.grey100,
            controller: offerText,
            textInputType: TextInputType.number,
          ),
          const SizedBox(height: 20),
          BtnApp(
            width: 140,
            titleBtn: "Hacer oferta",
            onPressed: () => Get.back(),
          ),
        ],
      ),
    );
  }
}
