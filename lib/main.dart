import 'package:advisor_app/src/infrastructure/services/storage/loca.dart';
import 'package:firebase_core/firebase_core.dart';

import 'firebase_options.dart';
import 'src/binding/binding_app.dart';
import 'src/presentation/presentation.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  LocalPreferences().initPrefs();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.LOGINVIEW,
      theme: themeApp,
      defaultTransition: Transition.fadeIn,
      getPages: AppPages.pages,
      initialBinding: InitialBinding(),
    );
  }
}
