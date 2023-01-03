// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:flutter_font_picker/flutter_font_picker.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:screenshot/screenshot.dart';
import 'package:lovespoem/modules/generate/generate_controller.dart';
import 'package:lovespoem/shared/constants/colors.dart';
import 'package:typewritertext/typewritertext.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class GenerateScreen extends GetView<GenerateController> {

  GenerateScreen({super.key});
  static String poemTitle = "Oysa Herkes Öldürür Sevdiğini";


  @override
  Widget build(BuildContext context) {
    var arguments = Get.arguments;

    return Scaffold(
        appBar: AppBar(toolbarHeight: 3.h),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 1.h,
              ),
              Center(
                child: Screenshot(
                  controller: controller.ssController,
                  child: Poem(
                    text: arguments[0].toString(),
                    controller: controller,
                  ),
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              Obx(
                () => Center(
                    child: Bounceable(
                  onTap: () {
                    if (controller.speakState.isFalse) {

                      controller.speak(arguments[0].toString());
                      controller.speakState.value = true;

                    } else {
                      controller.stop();
                    }
                  },
                  child: controller.speakState.value
                      ? Center(
                          child: Icon(
                            Icons.pause_circle,
                            color: AppColors.cobalite,
                            size: 30.sp,
                          ),
                        )
                      : Center(
                          child: Icon(
                            Icons.play_circle,
                            color: AppColors.cobalite,
                            size: 30.sp,
                          ),
                        ),
                )),
              ),
              SizedBox(
                height: 2.h,
              ),
              ShareButton(controller: controller),
              PoemStyleButton(
                controller: controller,
              )
            ],
          ),
        ));
  }
}

//Şiirin bulunduğu widget
class Poem extends StatelessWidget {
  const Poem({Key? key, required this.text, required this.controller})
      : super(key: key);

  final String text;

  final GenerateController controller;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        width: 95.w,
        height: 65.h,
        decoration: BoxDecoration(
          color: Colors.white,
          image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage(
              controller.bgPath.value,
            ),
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
              child: TypeWriterText(
                  alignment: Alignment.center,
                  text: Text(text,
                      textAlign: TextAlign.center,
                      style: controller.items.first.copyWith(
                          color: controller.textColor.value,
                          fontSize: controller.fontSize.value.toDouble())),
                  duration: const Duration(milliseconds: 25))),
        ),
      ),
    );
  }
}

//Şiir font değişiklik butonu
class PoemStyleButton extends StatelessWidget {
  const PoemStyleButton({
    Key? key,
    required this.controller,
  }) : super(key: key);
  final GenerateController controller;
  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (BuildContext context) {
              return Container(
                width: 100.w,
                height: 40.h,
                color: AppColors.cobalite,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          "Pick a font",
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 18.sp),
                        ),
                        TextButton(
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return Dialog(
                                      child: Theme(
                                    data: ThemeData(
                                        primaryColor: AppColors.cobalite),
                                    child: FontPicker(
                                        showInDialog: true,
                                        onFontChanged: (font) {
                                          controller.selectedFont.value =
                                              font.fontFamily;
                                          controller.selectedFontTextStyle[0] =
                                              font.toTextStyle();
                                        },
                                        googleFonts: controller.myGoogleFonts),
                                  ));
                                });
                          },
                          child: Obx(() => Text(
                                controller.selectedFont.value,
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18.sp,
                                    color: Colors.white),
                              )),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text("Pick a font size"),
                        TextButton(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                title: Text(
                                  "Pick Your Font Size",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 18.sp),
                                ),
                                content: Obx(
                                  () => SizedBox(
                                    width: 100.w,
                                    height: 25.h,
                                    child: Theme(
                                      data: ThemeData(
                                          primaryColor: AppColors.cobalite),
                                      child: Center(
                                        child: Column(children: [
                                          NumberPicker(
                                            textStyle: TextStyle(
                                                color: AppColors.cobalite
                                                    .withOpacity(0.5)),
                                            selectedTextStyle: TextStyle(
                                                color: AppColors.cobalite,
                                                fontSize: 24.sp),
                                            value: controller.fontSize.value,
                                            minValue: 1,
                                            maxValue: 100,
                                            step: 1,
                                            itemHeight: 100,
                                            axis: Axis.horizontal,
                                            onChanged: (value) => controller
                                                .fontSize.value = value,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              IconButton(
                                                  icon: Icon(
                                                    Icons.remove,
                                                    color: AppColors.cobalite,
                                                  ),
                                                  onPressed: () {
                                                    final newValue = controller
                                                            .fontSize.value -
                                                        5;
                                                    controller.fontSize.value =
                                                        newValue.clamp(1, 100);
                                                  }),
                                              Text(
                                                  'Font size : ${controller.fontSize.value}'),
                                              IconButton(
                                                  icon: Icon(
                                                    Icons.add,
                                                    color: AppColors.cobalite,
                                                  ),
                                                  onPressed: () {
                                                    final newValue = controller
                                                            .fontSize.value +
                                                        5;
                                                    controller.fontSize.value =
                                                        newValue.clamp(1, 100);
                                                  }),
                                            ],
                                          ),
                                          TextButton(
                                            child: Text(
                                              "SELECT",
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  color: AppColors.cobalite),
                                            ),
                                            onPressed: () {
                                              Get.back();
                                            },
                                          ),
                                        ]),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                          child: Obx(() => Text(
                                controller.fontSize.value.toString(),
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18.sp,
                                    color: Colors.white),
                              )),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          "Pick a text color",
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 18.sp),
                        ),
                        TextButton(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: ((context) => AlertDialog(
                                  title: Text(
                                    "Pick Your Color",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 18.sp),
                                  ),
                                  content: SizedBox(
                                    width: 100.w,
                                    height: 50.h,
                                    child: Column(
                                      children: [
                                        BlockPicker(
                                            availableColors:
                                                controller.fullMaterialColors,
                                            pickerColor:
                                                controller.textColor.value,
                                            onColorChanged: ((color) {
                                              controller.textColor.value =
                                                  color;
                                              if (kDebugMode) {
                                                print(controller.textColor.value
                                                  ..toString());
                                              }
                                            })),
                                        TextButton(
                                          child: Text(
                                            "SELECT",
                                            style: TextStyle(fontSize: 20),
                                          ),
                                          onPressed: () {
                                            Get.back();
                                          },
                                        ),
                                      ],
                                    ),
                                  ))),
                            );
                          },
                          child: Obx(
                            () => Text(
                              controller.textColor.value
                                  .toString()
                                  .replaceAll("Color(0xff", "#")
                                  .replaceAll("MaterialColor(primary", "")
                                  .replaceAll("MaterialAccentColor(primary", "")
                                  .replaceAll(
                                      "ColorSwatch<dynamic>(primary", "")
                                  .replaceAll("value:", "")
                                  .replaceAll(")", ""),
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 18.sp,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          "Pick a poem background",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 18.sp,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                      content: SingleChildScrollView(
                                        child: Column(children: [
                                          selectBg("assets/images/bg.png"),
                                          selectBg("assets/images/bg2.jpg"),
                                          selectBg("assets/images/bg3.jpg"),
                                          selectBg("assets/images/bg4.jpg"),
                                          selectBg("assets/images/bg5.jpg"),
                                          selectBg("assets/images/bg6.jpg"),
                                        ]),
                                      ),
                                    ));
                          },
                          child: Text(
                            controller.bgPath.value
                                .replaceAll("assets/images/", "")
                                .replaceAll(".png", "")
                                .replaceAll(".jpg", ""),
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 18.sp,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          );
        },
        child: const Text(
          "Poem Style",
          style: TextStyle(color: Colors.grey),
        ));
  }

  Bounceable selectBg(String bgPath) {
    return Bounceable(
      onTap: () {
        controller.bgPath.value = bgPath;

        Get.back();
      },
      child: Card(
        elevation: 8,
        child: Image.asset(
          bgPath,
          height: 50.h,
          width: 100.w,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

//Paylaşma butonu
class ShareButton extends StatelessWidget {
  const ShareButton({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final GenerateController controller;

  @override
  Widget build(BuildContext context) {
    return Bounceable(
      onTap: () {
        controller.share();
      },
      child: Container(
        width: 80.w,
        height: 8.h,
        // ignore: sort_child_properties_last
        child: Center(
          child: Text("Share",
              style: GoogleFonts.abel(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 2,
                  color: Colors.white)),
        ),
        decoration: BoxDecoration(
            color: AppColors.cobalite,
            borderRadius: BorderRadius.circular(16.sp)),
      ),
    );
  }
}

//Şiir başlığı

// ignore: must_be_immutable
class PoemTitle extends StatelessWidget {
  String? title;
  PoemTitle({
    Key? key,
    this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title ?? "",
      textAlign: TextAlign.center,
      style: GoogleFonts.abhayaLibre(
          fontSize: 24.sp, color: Colors.black, fontWeight: FontWeight.w900),
    );
  }
}
