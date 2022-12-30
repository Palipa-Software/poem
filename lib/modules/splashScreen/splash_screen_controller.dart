import 'package:get/get.dart';

import '../../routes/app_pages.dart';

class SplashScreenController extends GetxController {
  @override
  void onReady() async {
    super.onReady();
    await Future.delayed(const Duration(milliseconds: 3000));
    Get.offAllNamed(Routes.HOME);
  }
}
