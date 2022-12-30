// ignore_for_file: unnecessary_null_comparison

import 'dart:io';
import 'dart:typed_data';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share_plus/share_plus.dart';

class GenerateController extends GetxController {
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
