import 'package:advisor_app/src/presentation/pages/request/views/list_request_data_content.dart';

import '../request.dart';

class RequestView extends StatelessWidget {
  const RequestView({super.key});

  @override
  Widget build(BuildContext context) {
    return const BodyTemplate(
      spacingTop: 0,
      isAppbar: false,
      titleAppbar: 'Perfil',
      heightBody: .99,
      isScroll: true,
      child: Column(
        children: [
          Text(
            "Solicitudes",
            style: StyleText.titleAppbar,
          ),
          SizedBox(height: 64),
          ListRequestData(data: ['', '', '', '']),
        ],
      ),
    );
  }
}
