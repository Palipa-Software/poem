import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lovespoem/routes/app_pages.dart';

class CategoryController extends GetxController {
  RxInt selectedIndex1 = 0.obs;
  RxInt selectedIndex2 = 0.obs;
  RxInt selectedIndex3 = 0.obs;
  RxInt selectedIndex4 = 0.obs;
  RxBool isLoading = false.obs;

  RxString answerWhom = "Father".obs;
  RxString answerOccassion = "Thank You".obs;
  RxString answerStyle = "Acrostic".obs;
  RxString answerTone = "Funny".obs;
  RxBool isExpanded1 = true.obs;
  RxBool isExpanded2 = false.obs;

  RxBool isExpanded3 = false.obs;

  RxBool isExpanded4 = false.obs;
  void getToGenerateScreen() {
    Get.toNamed(Routes.GENERATE);
  }
}
