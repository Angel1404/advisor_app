import '../../profile.dart';

class FormProfileContent extends StatelessWidget {
  const FormProfileContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          InputGenery(
            hintText: 'Titulo',
            backgroundColor: ColorApp.grey100,
          ),
          const SizedBox(height: 14),
          ListSelectionWidget(
            isMultiSelection: false,
            decoration: BoxDecoration(
              color: ColorApp.grey100,
              borderRadius: borderRadius5px,
            ),
            titleStyle: const TextStyle(
              color: Colors.grey,
            ),
            hintText: 'Area',
            listItems: List.generate(
              ['data'].length,
              (index) => SelectionItem(
                value: index,
                displayValue: index.toString(),
              ),
            ),
            onSingleItemSelected: (v) {},
          ),
          const SizedBox(height: 14),
          InputGenery(
            minHeight: 50,
            isMultiLinea: true,
            maxHeight: 60,
            hintText: '',
            textInputType: TextInputType.multiline,
            backgroundColor: ColorApp.grey100,
            controller: TextEditingController(),
          ),
          const SizedBox(height: 14),
          InputGenery(
            isMultiLinea: false,
            hintText: 'Tarifa',
            backgroundColor: ColorApp.grey100,
            controller: TextEditingController(),
          ),
        ],
      ),
    );
  }
}
