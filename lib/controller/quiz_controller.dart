import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizapp/model/m_answer.dart';
import 'package:quizapp/model/m_question.dart';
import 'package:quizapp/services/firestore_services.dart';
import 'package:quizapp/view/result/result_page.dart';

class QuizPageController extends GetxController
    with GetTickerProviderStateMixin {
  int topicId = 0;
  var lsQuestion = List<MQuestion>.empty().obs;
  var lsAnswer = List<MAnswer>.empty().obs;
  var mainPageController = PageController();
  List<MAnswer> lsSelected = [];
  var isLoading = true.obs;

  late AnimationController animationController;
  var valueTimer = 0.0.obs;

  QuizPageController(this.arguments);
  Map arguments;

  @override
  void onInit() async {
    topicId = arguments['topicid'];
    lsQuestion.value = await FirestoreServices().getDataQuestion(topicId);
    lsAnswer.value = await FirestoreServices().getDataAnswer(topicId);
    startQuestion(0);
    super.onInit();
  }

  void startQuestion(int indexQuestion) {
    isLoading(true);
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 30))
          ..addListener(() {
            valueTimer.value = animationController.value;
            if (animationController.value == 1.0) {
              submitDefaultAnswer();
              if (mainPageController.page!.round() + 1 == lsQuestion.length) {
                toResult();
              } else {
                startQuestion(mainPageController.page!.round() + 1);
              }
            }
          });
    animationController.forward(from: 0.0);
    if (indexQuestion > 0) {
      if (mainPageController.page!.round() + 1 == lsQuestion.length) {
        toResult();
      } else {
        mainPageController.jumpToPage(indexQuestion);
      }
    }
    isLoading(false);
  }

  void clickAnswer(int indexQuestion, MAnswer mAnswer) {
    lsSelected.add(mAnswer);
    startQuestion(indexQuestion);
  }

  void submitDefaultAnswer() {
    lsSelected.add(MAnswer(
        answertext: "-",
        score: 0,
        topicid: topicId,
        questionid: mainPageController.page!.round() + 1));
  }

  void toResult() {
    animationController.stop();
    List<MAnswer> lsCorrect = lsAnswer.where((e) => e.score == 1).toList();
    lsCorrect.sort((a, b) => a.questionid!.compareTo(b.questionid!));
    Get.off(() => ResultPage(), arguments: {
      "question": lsQuestion,
      "answer": lsSelected,
      "correct": lsCorrect
    });
  }

  @override
  dispose() {
    animationController.dispose(); // you need this
    super.dispose();
  }

  void exitQuiz() {
    Get.back();
  }
}
