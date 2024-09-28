import 'package:animate_do/animate_do.dart';
import '../../../presentation.dart';

class SplashScreen extends GetView<SplashScreenController> {
  const SplashScreen({super.key});
  @override
  Widget build(BuildContext context) {
    controller;
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: ColorApp.black,
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: Stack(
          children: [
            Align(
              child: ZoomIn(
                child: Image.asset(
                  logoApp,
                  height: 220,
                  width: 220,
                ),
              ),
            ),
            const Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.all(12.0),
                child: AutoSizeTextApp(title: "Version: 1.0.0"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
