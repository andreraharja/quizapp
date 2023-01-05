import 'package:flutter/material.dart';
import '../../controller/quiz_controller.dart';
import 'package:get/get.dart';

class QuizPageTimer extends StatelessWidget {
  const QuizPageTimer({
    Key? key,
    required QuizPageController quizPageController,
  })  : _quizPageController = quizPageController,
        super(key: key);

  final QuizPageController _quizPageController;

  @override
  Widget build(BuildContext context) {
    return Obx(() => LinearProgressIndicator(
        backgroundColor: Colors.grey,
        color: Colors.amber,
        value: _quizPageController.valueTimer.value));
  }
}
