import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizapp/model/m_answer.dart';
import 'package:quizapp/model/m_question.dart';
import 'package:quizapp/services/firestore_services.dart';
import 'package:quizapp/view/result/result_page.dart';

class QuizPageController extends GetxController {
  int topicId = 0;
  var lsQuestion = List<MQuestion>.empty().obs;
  var lsAnswer = List<MAnswer>.empty().obs;
  var mainPageController = PageController();
  List<MAnswer> selected = [];

  QuizPageController(this.arguments);
  Map arguments;

  @override
  void onInit() async {
    topicId = arguments['topicid'];
    lsQuestion.value = await FirestoreServices().getDataQuestion(topicId);
    lsAnswer.value = await FirestoreServices().getDataAnswer(topicId);
    super.onInit();
  }

  void nextQuestion(int indexQuestion, MAnswer mAnswer) {
    if (indexQuestion == lsQuestion.length) {
      Get.off(() => const ResultPage(),
          arguments: {"question": lsQuestion, "answer": selected});
    } else {
      selected.add(mAnswer);
      selected.toSet();
      mainPageController.jumpToPage(indexQuestion);
      for (var element in selected) {
        log(element.answertext!);
      }
    }
  }

  void exitQuiz() {
    Get.back();
  }
}
