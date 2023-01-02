// ignore_for_file: unnecessary_null_comparison

import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

import 'package:get/get.dart';

import 'package:path_provider/path_provider.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share_plus/share_plus.dart';

class GenerateController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    selectedFontTextStyle.add(const TextStyle());
  }

  RxBool speakState = false.obs;
  FlutterTts flutterTts = FlutterTts();
  void speak(String poem) async {
    flutterTts.setLanguage("en-US");
    await flutterTts.speak(poem).whenComplete(() => speakState.value = false);
  }

  void stop() async {
    await flutterTts.pause();
  }

  RxString bgPath = "assets/images/bg.png".obs;
  RxInt fontSize = 16.obs;
//Font Seçimi
  List<TextStyle> get items {
    return [...selectedFontTextStyle];
  }

  RxString selectedFont = "Roboto".obs;
  final selectedFontTextStyle = <TextStyle>[].obs;
  List<String> myGoogleFonts = [
    "Abril Fatface",
    "Aclonica",
    "Alegreya Sans",
    "Architects Daughter",
    "Archivo",
    "Archivo Narrow",
    "Bebas Neue",
    "Bitter",
    "Bree Serif",
    "Bungee",
    "Cabin",
    "Cairo",
    "Coda",
    "Comfortaa",
    "Comic Neue",
    "Cousine",
    "Croissant One",
    "Faster One",
    "Forum",
    "Great Vibes",
    "Heebo",
    "Inconsolata",
    "Josefin Slab",
    "Lato",
    "Libre Baskerville",
    "Lobster",
    "Lora",
    "Merriweather",
    "Montserrat",
    "Mukta",
    "Nunito",
    "Offside",
    "Open Sans",
    "Oswald",
    "Overlock",
    "Pacifico",
    "Playfair Display",
    "Poppins",
    "Raleway",
    "Roboto",
    "Roboto Mono",
    "Source Sans Pro",
    "Space Mono",
    "Spicy Rice",
    "Squada One",
    "Sue Ellen Francisco",
    "Trade Winds",
    "Ubuntu",
    "Varela",
    "Vollkorn",
    "Work Sans",
    "Zilla Slab"
  ];
//Renk seçimi
  Rx<Color> textColor = Colors.black.obs;
  // Map for Names and their Reviews for the Store
  List<ColorSwatch> fullMaterialColors = const <ColorSwatch>[
    const ColorSwatch(0xFFFFFFFF, {500: Colors.white}),
    const ColorSwatch(0xFF000000, {500: Colors.black}),
    Colors.red,
    Colors.redAccent,
    Colors.pink,
    Colors.pinkAccent,
    Colors.purple,
    Colors.purpleAccent,
    Colors.deepPurple,
    Colors.deepPurpleAccent,
    Colors.indigo,
    Colors.indigoAccent,
    Colors.blue,
    Colors.blueAccent,
    Colors.lightBlue,
    Colors.lightBlueAccent,
    Colors.cyan,
    Colors.cyanAccent,
    Colors.teal,
    Colors.tealAccent,
    Colors.green,
    Colors.greenAccent,
    Colors.lightGreen,
    Colors.lightGreenAccent,
    Colors.lime,
    Colors.limeAccent,
    Colors.yellow,
    Colors.yellowAccent,
    Colors.amber,
    Colors.amberAccent,
    Colors.orange,
    Colors.orangeAccent,
    Colors.deepOrange,
    Colors.deepOrangeAccent,
    Colors.brown,
    Colors.grey,
    Colors.blueGrey
  ];

  //Widget görüntüsü almak için controller
  final ssController = ScreenshotController();

//Widget görünütüsünü yakalayıp sosyal medyada paylaşma metodu
  Future<void> share() async {
    final image = await ssController.capture();
    if (image == null) return;
    saveAndShare(image);
  }
}

//Widget görüntüsünü kaydetip paylaşma metodu
Future saveAndShare(Uint8List bytes) async {
  final directory = await getApplicationDocumentsDirectory();
  final time = DateTime.now().toIso8601String().replaceAll('.', '_').replaceAll(':', '_');
  final image = File("${directory.path}/poem$time.png");
  image.writeAsBytes(bytes);
  await Share.shareXFiles([XFile(image.path)]).then((value) => null);
}
