import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:tutorai/modules/splashScreen/splash.dart';

class SplashScreen extends GetView<SplashScreenController> {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SplashScreenController());
    return Scaffold(
      backgroundColor: const Color(0xffF9F5FA),
      body: Center(
        child: Container(
          child: Lottie.asset("assets/jsons/lottie_splash.json", fit: BoxFit.cover, height: 100.w, width: 100.w),
        ),
      ),
    );
  }
}
