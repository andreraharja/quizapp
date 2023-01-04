import 'package:flutter/material.dart';
import '../../controller/quiz_controller.dart';

class QuizPageAppbar extends StatelessWidget implements PreferredSizeWidget {
  const QuizPageAppbar({
    Key? key,
    required QuizPageController quizPageController,
  })  : _quizPageController = quizPageController,
        super(key: key);

  final QuizPageController _quizPageController;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('Quiz Page'),
      centerTitle: true,
      backgroundColor: Colors.blue.shade900,
      elevation: 0,
      actions: [
        TextButton(
            onPressed: () {
              _quizPageController.exitQuiz();
            },
            child: const Text(
              'Exit',
              style: TextStyle(color: Colors.white),
            ))
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
