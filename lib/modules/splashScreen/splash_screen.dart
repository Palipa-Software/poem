import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:lovespoem/api/generate_api_controller.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:lovespoem/modules/splashScreen/splash.dart';

class SplashScreen extends GetView<SplashScreenController> {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    GenerateApiController apiController = GenerateApiController();
    Get.put(SplashScreenController());
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: EdgeInsets.only(top: 15.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  child: Lottie.asset("assets/jsons/lottie_splash.json",
                      fit: BoxFit.cover, height: 100.w, width: 100.w),
                ),
                SizedBox(
                  height: 5.h,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 4.w, right: 4.w),
                  child: TextFormField(
                    controller: apiController.nameController,
                    cursorColor: Color.fromARGB(255, 133, 116, 116),
                    textInputAction: TextInputAction.done,
                    decoration: InputDecoration(
                      border: UnderlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                      filled: true,
                      hintText: "To Who?",
                      hintStyle:
                          TextStyle(color: Color.fromARGB(255, 133, 116, 116)),
                    ),
                  ),
                ),
                SizedBox(
                  height: 6.h,
                ),
                Bounceable(
                  onTap: () {
                    controller
                        .getToCategoryScreen(apiController.nameController.text);
                  },
                  child: Container(
                    height: 7.h,
                    width: 55.w,
                    decoration: BoxDecoration(
                        color: Color(0xffa289f8),
                        borderRadius: BorderRadius.circular(20)),
                    child: Center(
                      child: Text(
                        "Let's Start!",
                        style: TextStyle(color: Colors.white, fontSize: 20.sp),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
