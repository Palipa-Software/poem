import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:get/get.dart';
import 'package:lovespoem/api/generate_api_controller.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:lovespoem/modules/category/category_controller.dart';
import 'package:lovespoem/shared/constants/categorylist_dummy.dart';

class CategoryScreen extends GetView<CategoryController> {
  CategoryScreen({super.key});
  GenerateApiController generateApiController = GenerateApiController();

  @override
  Widget build(BuildContext context) {
    var arguments = Get.arguments;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(10.h),
        child: AppBar(
            title: Padding(
              padding: EdgeInsets.only(top: 2.5.h),
              child: Text(
                "Turn Back",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            leading: Padding(
              padding: EdgeInsets.only(top: 2.h, left: 4.w),
              child: Bounceable(
                onTap: () {
                  Get.back();
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: Color(0xffa289f8), shape: BoxShape.circle),
                  child: Padding(
                    padding: EdgeInsets.only(left: 2.w),
                    child: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                      size: 20.sp,
                    ),
                  ),
                ),
              ),
            )),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListView.builder(
              shrinkWrap: true,
              itemCount: categorys.length,
              itemBuilder: (context, index) {
                return categorys[index];
              },
            ),
            SizedBox(
              height: 5.h,
            ),
            Obx(() {
              return Bounceable(
                onTap: () async {
                  controller.isLoading.value = true;
                  try {
                    await generateApiController.generateAPI(
                        arguments[0],
                        controller.answerWhom.value,
                        controller.answerOccassion.value,
                        controller.answerStyle.value,
                        controller.answerTone.value);
                  } catch (e) {
                  } finally {
                    controller.isLoading.value = false;
                  }
                },
                child: Container(
                  height: 7.h,
                  width: 55.w,
                  decoration: BoxDecoration(
                      color: const Color(0xffa289f8),
                      borderRadius: BorderRadius.circular(20)),
                  child: Center(
                    child: controller.isLoading == false
                        ? Text(
                            "Generate",
                            style:
                                TextStyle(color: Colors.white, fontSize: 20.sp),
                          )
                        : CircularProgressIndicator(
                            color: Colors.white,
                          ),
                  ),
                ),
              );
            })
          ],
        ),
      ),
    );
  }
}
