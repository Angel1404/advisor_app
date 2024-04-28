import 'package:advisor_app/src/presentation/pages/request/request.dart';

class ListRequestData extends StatelessWidget {
  const ListRequestData({super.key, required this.data});
  final List<dynamic> data;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) {
          return CardRequestDecoration(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _textInformation("Titulo", ColorApp.black),
                    _textInformation("Fecha", ColorApp.grey),
                  ],
                ),
                const SizedBox(height: 12),
                _textInformation("Tarifa", ColorApp.black),
                const SizedBox(height: 12),
                _textInformation(
                    "Descripcion,Descripcion,Descripcion,Descripcion,Descripcion,Descripcion,Descripcion,Descripcion,Descripcion,Descripcion,Descripcion,Descripcion,Descripcion,Descripcion,Descripcion,Descripcion,Descripcion,Descripcion,Descripcion,Descripcion,Descripcion,Descripcion,Descripcion,Descripcion,Descripcion,Descripcion,Descripcion,Descripcion,",
                    ColorApp.black),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const BtnApp(
                          width: 100,
                          titleBtn: "Aceptar",
                        ),
                        const SizedBox(width: 12),
                        BtnApp(
                          width: 100,
                          backgroundColor: Colors.red,
                          onPressed: () {},
                          titleBtn: "Rechazar",
                        )
                      ],
                    ),
                    _textInformation("Cliente", ColorApp.black),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _textInformation(text, color) {
    return Text(
      text,
      style: TextStyle(
        color: color,
      ),
    );
  }
}
