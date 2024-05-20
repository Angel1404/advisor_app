import '../presentation.dart';

class LogoAppCard extends StatelessWidget {
  const LogoAppCard({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: 100, width: 100, child: Image.asset(logoApp));
  }
}
