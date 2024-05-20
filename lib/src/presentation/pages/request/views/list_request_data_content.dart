import 'package:advisor_app/src/presentation/pages/request/request.dart';

class ListRequestData extends StatefulWidget {
  const ListRequestData({super.key, required this.data});
  final List<ServiceProModel> data;

  @override
  State<ListRequestData> createState() => _ListRequestDataState();
}

class _ListRequestDataState extends State<ListRequestData> {
  late final TextEditingController _offerText;
  final controller = RequestController.to;
  @override
  void initState() {
    super.initState();
    _offerText = TextEditingController();
  }

  @override
  void dispose() {
    _offerText.dispose();
    super.dispose();
  }

  acceptService(String idService) async {
    AppDialogs.loading();
    final response = await controller.acceptService(idService: idService);
    Get.back();

    if (response.isError) {
      AppDialogs.information(description: response.error!);
      return;
    }
    AppDialogs.information(description: "Servicio aceptado", isError: false);
  }

  offerService(String idService, double fee) async {
    await AppDialogs.dialogGeneryPage(OfferWidget(offerText: _offerText, fee: fee), heigth: .3);
    if (_offerText.text.isEmpty) {
      Get.back();
      return;
    }

    AppDialogs.loading();
    final response = await controller.offerService(
      idService: idService,
      offerAmount: _offerText.text,
    );
    Get.back();
    if (response.isError) {
      AppDialogs.information(description: response.error!);
      return;
    }
    AppDialogs.information(description: "Oferta realizada", isError: false);
    _offerText.clear();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: widget.data.length,
      itemBuilder: (context, index) {
        final service = widget.data[index];
        return CardDetailService(
          service: service,
          acceptService: () => acceptService(service.id!),
          offerService: () => offerService(service.id!, service.fee),
        );
      },
    );
  }
}
