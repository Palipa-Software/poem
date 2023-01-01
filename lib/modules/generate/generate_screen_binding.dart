import 'package:get/get.dart';
import 'package:lovespoem/modules/generate/generate_controller.dart';

class GenerateScreenBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GenerateController>(() => GenerateController());
  }
}
