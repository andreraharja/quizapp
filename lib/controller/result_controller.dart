import 'dart:io';
import 'dart:typed_data';
import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import '../model/m_answer.dart';
import '../model/m_question.dart';

class ResultPageController extends GetxController {
  var lsQuestion = List<MQuestion>.empty().obs;
  var lsAnswer = List<MAnswer>.empty().obs;
  var lsCorrect = List<MAnswer>.empty().obs;
  var correctAnswer = 0.obs;
  var isLoading = true.obs;
  var dataChart = <String, double>{};

  var statusBoundary = GlobalKey();
  File? file;

  ResultPageController(this.arguments);
  Map arguments;

  @override
  void onInit() {
    lsQuestion.value = arguments['question'];
    lsAnswer.value = arguments['answer'];
    lsCorrect.value = arguments['correct'];
    for (var element in lsAnswer) {
      correctAnswer.value += element.score!;
    }
    dataChart = {
      "correct": double.parse(correctAnswer.value.toString()),
      "wrong":
          double.parse((lsQuestion.length - correctAnswer.value).toString())
    };
    isLoading(false);
    super.onInit();
  }

  Future<void> shareScore() async {
    try {
      RenderRepaintBoundary boundary = statusBoundary.currentContext!
          .findRenderObject() as RenderRepaintBoundary;
      var image = await boundary.toImage();
      ByteData? byteData = await image.toByteData(format: ImageByteFormat.png);
      Uint8List pngBytes = byteData!.buffer.asUint8List();
      final appDir = await getApplicationDocumentsDirectory();
      DateTime now = DateTime.now();
      var nameQuiz = now.toString().removeAllWhitespace;
      file = await File('${appDir.path}/$nameQuiz.png').create();
      await file?.writeAsBytes(pngBytes);
      await Share.shareFiles(
        [file!.path],
        mimeTypes: ["image/png"],
        text: nameQuiz,
      );
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
  }
}
