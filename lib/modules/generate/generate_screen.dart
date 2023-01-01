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
import 'package:tutorai/modules/generate/generate_controller.dart';
import 'package:typewritertext/typewritertext.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class GenerateScreen extends GetView<GenerateController> {
  const GenerateScreen({super.key});
  static String poemTitle = "Oysa Herkes Öldürür Sevdiğini";
  static String poem =
      "Kulak verin bu dediklerime,\n Kimi bir bakışı ile yapar bunu,\nKimi dalkavukça sözler ile… \nKimi bir bakışıyla yapar bunu,\nKimi dalkavukça sözlerle.\nKorkaklar öpücük ile  öldürür...\nYürekliler kılıç darbeleriyle.\n Kimi gençken öldürür sevdiğini\n Kimi yaşlıyken.\n Şehvetli ellerle boğar kimi\n \nKimi altından ellerle\n Merhametli kişi bıçak kullanır\n Çünkü bıçakla ölen çabuk soğur\n Kimi yeterince sevmez kimi fazla sever\n Kimi satar; kimi de satın alır\n Kimi gözyaşı döker öldürürken\n Kimi kılı kıpırdamadan\n Çünkü herkes öldürür sevdiğini\n Ama herkes öldürdü diye ölmez.";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(toolbarHeight: 3.h),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: PoemTitle(
                  title: poemTitle,
                ),
              ),
              SizedBox(
                height: 1.h,
              ),
              Center(
                child: Screenshot(
                  controller: controller.ssController,
                  child: Poem(
                    text: poem,
                    path: "assets/images/bg3.jpg",
                    controller: controller,
                  ),
                ),
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
  const Poem({Key? key, required this.text, required this.path, required this.controller}) : super(key: key);

  final String text;
  final String path;
  final GenerateController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 95.w,
      height: 65.h,
      decoration: BoxDecoration(
        color: Colors.white,
        image: DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage(
            path,
          ),
        ),
      ),
      child: Obx(
        () => Center(
          child: SingleChildScrollView(
              child: TypeWriterText(
                  alignment: Alignment.center,
                  text: Text(text,
                      textAlign: TextAlign.center,
                      style: controller.items.first
                          .copyWith(color: controller.textColor.value, fontSize: controller.fontSize.value.toDouble())),
                  duration: const Duration(milliseconds: 70))),
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
                height: 90.h,
                color: const Color(0xff896AF5),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text("Pick a font"),
                        TextButton(
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return Dialog(
                                      child: FontPicker(
                                          showInDialog: true,
                                          onFontChanged: (font) {
                                            controller.selectedFont.value = font.fontFamily;
                                            controller.selectedFontTextStyle[0] = font.toTextStyle();
                                          },
                                          googleFonts: controller.myGoogleFonts));
                                });
                          },
                          child: Obx(() => Text(controller.selectedFont.value)),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text("Pick a font size"),
                        TextButton(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                title: Text("Pick Your Font Size"),
                                content: Obx(
                                  () => Container(
                                    width: 100.w,
                                    height: 25.h,
                                    child: Center(
                                      child: Column(children: [
                                        NumberPicker(
                                          value: controller.fontSize.value,
                                          minValue: 1,
                                          maxValue: 100,
                                          step: 1,
                                          itemHeight: 100,
                                          axis: Axis.horizontal,
                                          onChanged: (value) => controller.fontSize.value = value,
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            IconButton(
                                                icon: Icon(Icons.remove),
                                                onPressed: () {
                                                  final newValue = controller.fontSize.value - 5;
                                                  controller.fontSize.value = newValue.clamp(1, 100);
                                                }),
                                            Text('Font size : ${controller.fontSize.value}'),
                                            IconButton(
                                                icon: Icon(Icons.add),
                                                onPressed: () {
                                                  final newValue = controller.fontSize.value + 5;
                                                  controller.fontSize.value = newValue.clamp(1, 100);
                                                }),
                                          ],
                                        ),
                                        TextButton(
                                          child: Text(
                                            "SELECT",
                                            style: TextStyle(fontSize: 20),
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
                            );
                          },
                          child: Obx(() => Text(controller.fontSize.value.toString())),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text("Pick a text color"),
                        TextButton(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: ((context) => AlertDialog(
                                  title: Text("Pick Your Color"),
                                  content: Container(
                                    width: 100.w,
                                    height: 50.h,
                                    child: Column(
                                      children: [
                                        BlockPicker(
                                            availableColors: controller.fullMaterialColors,
                                            pickerColor: controller.textColor.value,
                                            onColorChanged: ((color) {
                                              controller.textColor.value = color;
                                              if (kDebugMode) {
                                                print(controller.textColor.value..toString());
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
                            () => Text(controller.textColor.value
                                .toString()
                                .replaceAll("Color(0xff", "#")
                                .replaceAll("MaterialColor(primary", "")
                                .replaceAll("MaterialAccentColor(primary", "")
                                .replaceAll("ColorSwatch<dynamic>(primary", "")
                                .replaceAll("value:", "")
                                .replaceAll(")", "")),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text("Pick a poem background"),
                        TextButton(
                          onPressed: () {},
                          child: Text("star"),
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
                  fontSize: 20.sp, fontWeight: FontWeight.w600, letterSpacing: 2, color: Colors.white)),
        ),
        decoration: BoxDecoration(color: const Color(0xff896AF5), borderRadius: BorderRadius.circular(16.sp)),
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
      style: GoogleFonts.abhayaLibre(fontSize: 24.sp, color: Colors.black, fontWeight: FontWeight.w900),
    );
  }
}
