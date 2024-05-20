import '../../../presentation.dart';

void showRateServiceModal(BuildContext context, {required String serviceID}) {
  showModalBottomSheet(
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(15),
        topRight: Radius.circular(15),
      ),
    ),
    context: context,
    builder: (context) {
      return RateServiceWidget(serviceID: serviceID);
    },
  );
}

class RateServiceWidget extends StatefulWidget {
  const RateServiceWidget({super.key, required this.serviceID});
  final String serviceID;
  @override
  State<RateServiceWidget> createState() => _RateServiceWidgetState();
}

class _RateServiceWidgetState extends State<RateServiceWidget> {
  final controller = CreateServiceController.to;

  // ignore: unused_local_variable
  int rate = 0;
  final start1 = false.obs;
  final start2 = false.obs;
  final start3 = false.obs;
  final start4 = false.obs;
  final start5 = false.obs;

  rateService() async {
    if (rate == 0) {
      Get.back();
      return;
    }
    AppDialogs.loading();
    final response = await controller.rateService(rate: rate, idService: widget.serviceID);
    Get.back();

    if (response.isError) {
      AppDialogs.information(description: response.error!);
      return;
    }
    Get.back();
    AppDialogs.information(description: "Se califico exitosamente el servicio", isError: false);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(height: 10.0),
        const Icon(Icons.star, color: Colors.yellow, size: 35.0),
        const SizedBox(height: 20.0),
        const Text(
          'Califique su experiencia\ndel servicio que ha recibido ',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: ColorApp.grey,
            fontSize: 18,
            fontWeight: FontWeight.w400,
          ),
        ),
        const SizedBox(height: 30.0),
        Obx(() {
          Color color1 = (start1.value == true) ? Colors.red : Colors.grey;
          Color color2 = (start2.value == true && start1.value == true) ? Colors.red : Colors.grey;
          Color color3 = (start3.value == true && start2.value == true && start1.value == true) ? Colors.red : Colors.grey;
          Color color4 = (start1.value == true && start2.value == true && start3.value == true && start4.value == true) ? Colors.yellow : Colors.grey;
          Color color5 = (start5.value == true && start1.value == true && start2.value == true && start3.value == true && start4.value == true)
              ? Colors.yellow
              : Colors.grey;

          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () {
                  start3.value = false;
                  start2.value = false;
                  start4.value = false;
                  start5.value = false;
                  start1.value = !start1.value;
                  rate = 1;
                },
                icon: Icon(Icons.star, size: 35.0, color: (start4.value || start5.value) ? Colors.yellow : color1),
              ),
              IconButton(
                onPressed: () {
                  start3.value = false;
                  start2.value = true;
                  start4.value = false;
                  start5.value = false;
                  start1.value = true;
                  rate = 2;
                },
                icon: Icon(Icons.star, size: 35.0, color: (start4.value || start5.value) ? Colors.yellow : color2),
              ),
              IconButton(
                onPressed: () {
                  start3.value = true;
                  start2.value = true;
                  start4.value = false;
                  start5.value = false;
                  start1.value = true;
                  rate = 3;
                },
                icon: Icon(Icons.star, size: 35.0, color: (start4.value || start5.value) ? Colors.yellow : color3),
              ),
              IconButton(
                onPressed: () {
                  start5.value = false;
                  start1.value = true;
                  start2.value = true;
                  start3.value = true;
                  start4.value = true;
                  rate = 4;
                },
                icon: Icon(Icons.star, size: 35.0, color: color4),
              ),
              IconButton(
                onPressed: () {
                  start5.value = true;
                  start1.value = true;
                  start2.value = true;
                  start3.value = true;
                  start4.value = true;
                  rate = 5;
                },
                icon: Icon(Icons.star, size: 35.0, color: color5),
              ),
            ],
          );
        }),
        const SizedBox(height: 10.0),
        Obx(() {
          return ElevatedButton(
            onPressed: rateService,
            style: ElevatedButton.styleFrom(
              backgroundColor: (start1.value == true) ? Colors.green : Colors.white,
              elevation: 0.0,
              side: BorderSide(color: ColorApp.greyLight, width: 1),
            ),
            child: Text(
              'Enviar calificación',
              style: TextStyle(
                color: (start1.value == true) ? Colors.white : ColorApp.grey,
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
          );
        }),
        const SizedBox(height: 40.0),
      ],
    );
  }
}
