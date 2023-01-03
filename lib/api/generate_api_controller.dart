import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:lovespoem/modules/category/category_controller.dart';
import 'package:lovespoem/modules/category/category_screen.dart';
import 'package:lovespoem/modules/generate/generate_controller.dart';
import 'package:lovespoem/modules/splashScreen/splash.dart';
import 'package:lovespoem/routes/app_pages.dart';

class GenerateApiController extends GetxController {
  SplashScreenController splashScreenController = SplashScreenController();
  CategoryController categoryController = CategoryController();
  GenerateController generateController = GenerateController();
  TextEditingController nameController = TextEditingController();

  Future<dynamic> generateAPI(String name, String whom, String occassion,
      String style, String tone) async {
    var url = await Uri.https("poemapi.bilenmehmet.com", "/api/Generate");

    var response = await http.post(
      url,
      body: {
        "name": name,
        "whom": whom,
        "occassion": occassion,
        "style": style,
        "tone": tone
      },
    );
    var data = json.decode(response.body);
    if (data["status"] == true) {
      generateController.poem.value = data["message"];
      Get.toNamed(Routes.GENERATE, arguments: [data["message"]]);
    } else {
      print("Data gelmedi");
    }
    ;
  }
}
