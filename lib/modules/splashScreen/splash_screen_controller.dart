import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../routes/app_pages.dart';

class SplashScreenController extends GetxController {
  RxString name = "".obs;
  @override
  void onReady() async {
    super.onReady();
  }

  void getToCategoryScreen(String name) {
    Get.toNamed(Routes.CATEGORY, arguments: [name]);
  }
}
