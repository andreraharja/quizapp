import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/quiz_controller.dart';

class QuizPageTimer extends StatelessWidget {
  const QuizPageTimer({
    Key? key,
    required QuizPageController quizPageController,
  })  : _quizPageController = quizPageController,
        super(key: key);

  final QuizPageController _quizPageController;

  @override
  Widget build(BuildContext context) {
    return Obx(() => Text(
      _quizPageController.valueTimer.value.toString() + "s",
      style: Theme.of(context)
          .textTheme
          .titleMedium!
          .apply(color: Colors.white),
    ));
  }
}

