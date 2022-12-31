import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryController extends GetxController {
  RxInt selectedIndex1 = 0.obs;
  RxInt selectedIndex2 = 0.obs;
  RxInt selectedIndex3 = 0.obs;
  RxInt selectedIndex4 = 0.obs;

  RxString answer1 = "Father".obs;
  RxString answer2 = "Thank You".obs;
  RxString answer3 = "Acrostic".obs;
  RxString answer4 = "Funny".obs;
  RxBool isExpanded1 = true.obs;
  RxBool isExpanded2 = false.obs;

  RxBool isExpanded3 = false.obs;

  RxBool isExpanded4 = false.obs;
}
