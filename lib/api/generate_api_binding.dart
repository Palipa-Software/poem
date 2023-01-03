import 'package:get/get.dart';
import 'package:lovespoem/modules/generate/generate_controller.dart';

import 'generate_api_controller.dart';

class GenerateApiBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GenerateApiController>(() => GenerateApiController());
  }
}
