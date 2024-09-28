import '../../request/request.dart';

class CreateServiceContent extends StatefulWidget {
  const CreateServiceContent({super.key});

  @override
  State<CreateServiceContent> createState() => _CreateServiceContentState();
}

class _CreateServiceContentState extends State<CreateServiceContent> {
  late final TextEditingController _title;
  late final TextEditingController _description;
  late final TextEditingController _fee;

  @override
  void initState() {
    super.initState();
    _title = TextEditingController();
    _description = TextEditingController();
    _fee = TextEditingController();
  }

  @override
  void dispose() {
    _title.dispose();
    _description.dispose();
    _fee.dispose();
    super.dispose();
  }

  final controller = CreateServiceController.to;

  createService() async {
    AppDialogs.loading();
    final response = await controller.createService(description: _description.text, title: _title.text, fee: _fee.text);
    Get.back();

    if (response.isError) {
      AppDialogs.information(
        description: response.error!,
      );
      return;
    }
    AppDialogs.information(
      description: "Solicitud creada con exito",
      isError: false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          InputGenery(
            hintText: 'Titulo',
            backgroundColor: ColorApp.grey100,
            controller: _title,
          ),
          const SizedBox(height: 14),
          InputGeneryAmplio(
            hintText: 'Descripción',
            textInputType: TextInputType.multiline,
            controller: _description,
          ),
          const SizedBox(height: 14),
          InputGenery(
            isMultiLinea: false,
            hintText: 'Tarifa',
            backgroundColor: ColorApp.grey100,
            controller: _fee,
            textInputType: TextInputType.number,
          ),
          const SizedBox(height: 44),
          BtnApp(
            width: 100,
            height: 45,
            onPressed: createService,
            titleBtn: 'Crear',
            backgroundColor: ColorApp.black,
          ),
        ],
      ),
    );
  }
}







// const SizedBox(height: 14),
          // ListSelectionWidget(
          //   isMultiSelection: false,
          //   decoration: BoxDecoration(
          //     color: ColorApp.grey100,
          //     borderRadius: borderRadius5px,
          //   ),
          //   titleStyle: const TextStyle(
          //     color: Colors.grey,
          //   ),
          //   hintText: 'Area',
          //   listItems: List.generate(
          //     ['data'].length,
          //     (index) => SelectionItem(
          //       value: index,
          //       displayValue: index.toString(),
          //     ),
          //   ),
          //   onSingleItemSelected: (v) {},
          // ),