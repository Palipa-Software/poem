import 'package:get/get.dart';
import 'package:lovespoem/modules/splashScreen/splash.dart';

class SplashScreenBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SplashScreenController>(() => SplashScreenController());
  }
}
