import 'package:get/get.dart';

import 'package:tutorai/modules/category/category_binding.dart';
import 'package:tutorai/modules/category/category_screen.dart';
import '../modules/splashScreen/splash.dart';
import 'package:tutorai/modules/generate/generate_screen_binding.dart';
import 'package:tutorai/modules/generate/generate_screen.dart';



part 'app_routes.dart';

class AppPages {
  // ignore: constant_identifier_names

  static const INITIAL = Routes.CATEGORY;




  static final routes = [
    GetPage(
      name: Routes.SPLASH,
      page: () => const SplashScreen(),
      binding: SplashScreenBinding(),
    ),
    GetPage(

      name: Routes.CATEGORY,
      page: () => const CategoryScreen(),
      binding: CategoryBinding(),
),
GetPage(
      name: Routes.GENERATE,
      page: () => const GenerateScreen(),
      binding: GenerateScreenBinding(),
),
    
  ];
}
