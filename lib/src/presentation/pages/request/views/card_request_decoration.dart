import '../../home/home.dart';

class CardRequestDecoration extends StatelessWidget {
  const CardRequestDecoration({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 12,
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 12,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            blurRadius: 2,
            color: ColorApp.black.withOpacity(0.2),
          )
        ],
      ),
      child: child,
    );
  }
}
