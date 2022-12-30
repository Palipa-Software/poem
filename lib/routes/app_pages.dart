import 'package:get/get.dart';
import 'package:tutorai/modules/generate/generate_screen_binding.dart';
import 'package:tutorai/modules/generate/generate_screen.dart';
import 'package:tutorai/modules/splashScreen/splash.dart';

part 'app_routes.dart';

class AppPages {
  // ignore: constant_identifier_names
  static const INITIAL = Routes.GENERATE;

  static final routes = [
    GetPage(
      name: Routes.SPLASH,
      page: () => const SplashScreen(),
      binding: SplashScreenBinding(),
    ),
    GetPage(
      name: Routes.GENERATE,
      page: () => const GenerateScreen(),
      binding: GenerateScreenBinding(),
    ),
  ];
}
