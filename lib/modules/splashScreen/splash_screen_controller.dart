import 'package:get/get.dart';

import '../../routes/app_pages.dart';

class SplashScreenController extends GetxController {
  @override
  void onReady() async {
    super.onReady();
  }

  void getToCategoryScreen() {
    Get.toNamed(Routes.CATEGORY);
  }
}
