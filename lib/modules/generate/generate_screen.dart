// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:screenshot/screenshot.dart';
import 'package:tutorai/modules/generate/generate_controller.dart';

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
                  child: Poem(text: poem, path: "assets/images/bg.png"),
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              ShareButton(controller: controller),
              const PoemStyleButton()
            ],
          ),
        ));
  }
}

//Şiirin bulunduğu widget
class Poem extends StatelessWidget {
  const Poem({
    Key? key,
    required this.text,
    required this.path,
  }) : super(key: key);

  final String text;
  final String path;

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
      child: Center(
        child: SingleChildScrollView(
          child: AnimatedTextKit(
            totalRepeatCount: 1,
            repeatForever: false,
            animatedTexts: [
              TyperAnimatedText(
                text,
                textAlign: TextAlign.center,
                textStyle: GoogleFonts.abhayaLibre(
                  color: Colors.black,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w600,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

//Şiir font değişiklik butonu
class PoemStyleButton extends StatelessWidget {
  const PoemStyleButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () {},
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
