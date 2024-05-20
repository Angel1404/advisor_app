import 'package:advisor_app/src/presentation/utils/helpers.dart';

import '../request.dart';

class CardDetailService extends StatelessWidget {
  const CardDetailService({
    super.key,
    required this.service,
    this.isUser = false,
    this.acceptService,
    this.offerService,
    this.rejectService,
    this.completedService,
  });

  final ServiceProModel service;
  final bool isUser;
  final Function()? acceptService;
  final Function()? offerService;
  final Function()? rejectService;
  final Function()? completedService;

  @override
  Widget build(BuildContext context) {
    final date = DateTime.parse(service.createdAt);
    return CardRequestDecoration(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextInformation(
                text: service.title,
                color: ColorApp.black,
                title: "Titulo: ",
              ),
              TextInformation(
                text: "${date.year}-${date.month}-${date.day}",
                color: ColorApp.grey,
                title: "Fecha: ",
              ),
            ],
          ),
          const SizedBox(height: 10),
          TextInformation(
            text: service.status.status,
            color: const Color(0xFF000000),
            title: "Estado: ",
          ),
          const SizedBox(height: 10),
          TextInformation(
            text: service.fee.toString(),
            color: ColorApp.black,
            title: "Tarifa: ",
          ),
          const SizedBox(height: 10),
          if (service.offer != null && isUser) ...[
            TextInformation(
              text: service.offer.toString(),
              color: Colors.red,
              title: "Oferta: ",
            ),
            const SizedBox(height: 10),
          ],
          if (!isUser)
            TextInformation(
              text: service.nameClient ?? '',
              color: ColorApp.black,
              title: "Nombre del cliente: ",
            ),
          if (isUser)
            TextInformation(
              text: service.nameProfesional ?? '',
              color: ColorApp.black,
              title: "Nombre del profesional: ",
            ),
          const SizedBox(height: 10),
          TextInformation(
            text: service.description,
            color: ColorApp.black,
            title: "Descripción: ",
          ),
          if (service.rate != null) ...[
            const SizedBox(height: 10),
            TextInformation(
              text: '${service.rate} estrellas',
              color: ColorApp.black,
              title: "Calificación del servicio: ",
            ),
          ],
          const SizedBox(height: 10),
          if (service.status == StateService.aceepted)
            InkWell(
              onTap: () {
                openWhatsApp(
                  phoneNumber: isUser ? service.phoneUser : service.phoneProfesional,
                );
              },
              child: const Row(
                children: [
                  AutoSizeTextApp(title: "Contactar"),
                  SizedBox(width: 5),
                  Icon(
                    Icons.phone_android_outlined,
                  ),
                ],
              ),
            ),
          const SizedBox(height: 10),
          SizedBox(
            width: double.maxFinite,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                if (!isUser && service.status == StateService.none) ...[
                  BtnApp(
                    width: 120,
                    backgroundColor: Colors.red,
                    onPressed: offerService,
                    titleBtn: "Ofertar",
                  ),
                  BtnApp(
                    width: 120,
                    titleBtn: "Aceptar",
                    onPressed: acceptService,
                  ),
                ],
                if (service.offer != null && isUser) ...[
                  BtnApp(
                    width: 120,
                    titleBtn: "Rechazar",
                    onPressed: rejectService,
                    backgroundColor: Colors.red,
                  ),
                  BtnApp(
                    width: 120,
                    titleBtn: "Aceptar",
                    onPressed: acceptService,
                  ),
                ],
                if (isUser && service.status == StateService.aceepted) ...[
                  BtnApp(
                    width: 120,
                    titleBtn: "Servicio completado",
                    onPressed: completedService,
                  ),
                ]
              ],
            ),
          ),
        ],
      ),
    );
  }
}
