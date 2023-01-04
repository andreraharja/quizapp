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
  List<MAnswer> lsSelected = [];

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
    lsSelected.add(mAnswer);
    lsSelected.toSet();
    if (indexQuestion == lsQuestion.length) {
      List<MAnswer> lsCorrect = lsAnswer.where((e) => e.score == 1).toList();
      lsCorrect.sort((a, b) => a.questionid!.compareTo(b.questionid!));
      Get.off(() => ResultPage(), arguments: {
        "question": lsQuestion,
        "answer": lsSelected,
        "correct": lsCorrect
      });
    } else {
      mainPageController.jumpToPage(indexQuestion);
      for (var element in lsSelected) {
        log(element.answertext!);
      }
    }
  }

  void exitQuiz() {
    Get.back();
  }
}
