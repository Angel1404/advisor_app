import '../../request/request.dart';

class CreateServiceView extends StatefulWidget {
  const CreateServiceView({super.key});

  @override
  State<CreateServiceView> createState() => _CreateServiceViewState();
}

class _CreateServiceViewState extends State<CreateServiceView> {
  final controller = CreateServiceController.to;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      controller.getActiveService();
    });
  }

  acceptOffer() async {
    AppDialogs.loading();
    final response = await controller.acceptOfferService();
    Get.back();

    if (response.isError) {
      AppDialogs.information(description: response.error!);
      return;
    }
    AppDialogs.information(description: "Oferta aceptada", isError: false);
  }

  rejectOfferService() async {
    AppDialogs.loading();
    final response = await controller.rejectOfferService();
    Get.back();

    if (response.isError) {
      AppDialogs.information(description: response.error!);
      return;
    }
    AppDialogs.information(description: "Oferta rechazada", isError: false);
  }

  completedService() async {
    final serviceId = controller.serviceActive.value!.id!;
    AppDialogs.loading();
    final response = await controller.completedService();
    Get.back();
    if (response.isError) {
      AppDialogs.information(description: response.error!);
      return;
    }
    await AppDialogs.information(description: "El servicio se completó exitosamente", isError: false);
    if (mounted) showRateServiceModal(context, serviceID: serviceId);
  }

  @override
  Widget build(BuildContext context) {
    return BodyTemplate(
      spacingTop: .01,
      isAppbar: false,
      heightBody: .73,
      isScroll: true,
      child: Obx(
        () => Column(
          children: [
            if (controller.serviceActive.value != null) ...[
              const AutoSizeTextApp(
                title: "Servicio activo",
                textStyle: StyleText.titleAppbar,
                textAlign: TextAlign.right,
              ),
              CardDetailService(
                service: controller.serviceActive.value!,
                isUser: true,
                acceptService: acceptOffer,
                rejectService: rejectOfferService,
                completedService: completedService,
              ),
            ] else ...[
              const CreateServiceContent(),
            ],
          ],
        ),
      ),
    );
  }
}
