import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizapp/view/quiz/quiz_page_answer.dart';
import 'package:quizapp/view/quiz/quiz_page_appbar.dart';
import 'package:quizapp/view/quiz/quiz_page_question.dart';
import 'package:quizapp/view/quiz/quiz_page_timer.dart';

import '../../controller/quiz_controller.dart';

class QuizPage extends StatelessWidget {
  QuizPage({Key? key}) : super(key: key);
  final QuizPageController _quizPageController =
      Get.put(QuizPageController(Get.arguments));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: QuizPageAppbar(quizPageController: _quizPageController),
      body: Obx(() => _quizPageController.isLoading.value
          ? const Center(child: CircularProgressIndicator())
          : Container(
              color: Colors.blue.shade900,
              child: PageView.builder(
                physics: const NeverScrollableScrollPhysics(),
                controller: _quizPageController.mainPageController,
                itemCount: _quizPageController.lsQuestion.length,
                itemBuilder: (BuildContext context, int indexQuestion) {
                  return Column(
                    children: [
                      QuizPageTimer(quizPageController: _quizPageController),
                      const SizedBox(
                        height: 10,
                      ),
                      QuizPageQuestion(
                        quizPageController: _quizPageController,
                        indexQuestion: indexQuestion,
                      ),
                      QuizPageAnswer(
                        quizPageController: _quizPageController,
                        indexQuestion: indexQuestion,
                      )
                    ],
                  );
                },
              ),
            )),
    );
  }
}
