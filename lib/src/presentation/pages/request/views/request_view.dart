import '../request.dart';

class RequestView extends StatefulWidget {
  const RequestView({super.key});

  @override
  State<RequestView> createState() => _RequestViewState();
}

class _RequestViewState extends State<RequestView> {
  final controller = RequestController.to;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPersistentFrameCallback((timeStamp) {
      controller.getAllService();
    });
  }

  @override
  Widget build(BuildContext context) {
    return BodyTemplate(
      paddingBody: const EdgeInsets.only(top: 20),
      spacingTop: 0,
      isAppbar: false,
      heightBody: .99,
      child: TabbarRequest(),
    );
  }
}

class TabbarRequest extends GetView<RequestController> {
  TabbarRequest({super.key});
  final listItemTabs = [
    StateService.none,
    StateService.aceepted,
    StateService.completed,
    StateService.canceled,
  ];
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => TabsPages(
        titlesTabs: listItemTabs.map((e) => e.status).toList(),
        children: listItemTabs.map((e) {
          final listServiceForstatus = controller.listServices.value.where((service) => service.status == e).toList();
          if (listServiceForstatus.isNotEmpty) {
            return ListRequestData(data: listServiceForstatus);
          }
          return const Center(
            child: AutoSizeTextApp(
              title: "No hay solicitudes en este momento",
              textStyle: StyleText.titleAppbar,
            ),
          );
        }).toList(),
      ),
    );
  }
}
// [
//           if (controller.listServices.isNotEmpty) ...[
//             ListRequestData(data: controller.listServices.value),
//           ] else ...[
//             const Center(
//               child: AutoSizeTextApp(
//                 title: "No hay solicitudes en este momento",
//                 textStyle: StyleText.titleAppbar,
//               ),
//             ),
//           ],
//           if (controller.listServices.isNotEmpty) ...[
//             ListRequestData(data: controller.listServices.value),
//           ] else ...[
//             const Center(
//               child: AutoSizeTextApp(
//                 title: "No hay solicitudes en este momento",
//                 textStyle: StyleText.titleAppbar,
//               ),
//             ),
//           ],
//           if (controller.listServices.isNotEmpty) ...[
//             ListRequestData(data: controller.listServices.value),
//           ] else ...[
//             const Center(
//               child: AutoSizeTextApp(
//                 title: "No hay solicitudes en este momento",
//                 textStyle: StyleText.titleAppbar,
//               ),
//             ),
//           ]
//         ],
