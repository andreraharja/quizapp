import 'dart:async';

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
  var valueTimer = 30.obs;
  var isAnswer = false;

  QuizPageController(this.arguments);
  Map arguments;

  @override
  void onInit() async {
    topicId = arguments['topicid'];
    lsQuestion.value = await FirestoreServices().getDataQuestion(topicId);
    lsAnswer.value = await FirestoreServices().getDataAnswer(topicId);
    initStartTimer();
    super.onInit();
  }

  void initStartTimer() {
    Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      valueTimer.value -= 1;
      if (valueTimer.value == -1) {
        timer.cancel();
        submitDefaultAnswer();
        if (mainPageController.page!.round() + 1 == lsQuestion.length) {
          toResult();
        } else {
          valueTimer = 30.obs;
          initStartTimer();
          mainPageController.jumpToPage(mainPageController.page!.round() + 1);
        }
      } else {
        if (isAnswer) {
          timer.cancel();
        }
      }
    });
  }

  void clickAnswer(int indexQuestion, MAnswer mAnswer) {
    isAnswer = true;
    lsSelected.add(mAnswer);
    lsSelected.toSet();
    if (indexQuestion == lsQuestion.length) {
      toResult();
    } else {
      isAnswer = false;
      valueTimer = 30.obs;
      mainPageController.jumpToPage(indexQuestion);
    }
  }

  void submitDefaultAnswer() {
    lsSelected.add(MAnswer(
        answertext: "-",
        score: 0,
        topicid: topicId,
        questionid: mainPageController.page!.round() + 1));
  }

  void toResult() {
    List<MAnswer> lsCorrect = lsAnswer.where((e) => e.score == 1).toList();
    lsCorrect.sort((a, b) => a.questionid!.compareTo(b.questionid!));
    Get.off(() => ResultPage(), arguments: {
      "question": lsQuestion,
      "answer": lsSelected,
      "correct": lsCorrect
    });
  }

  void exitQuiz() {
    Get.back();
  }
}
