import 'package:flutter/material.dart';
import '../../controller/quiz_controller.dart';

class QuizPageQuestion extends StatelessWidget {
  const QuizPageQuestion(
      {Key? key,
        required QuizPageController quizPageController,
        required this.indexQuestion})
      : _quizPageController = quizPageController,
        super(key: key);

  final QuizPageController _quizPageController;
  final int indexQuestion;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      margin: const EdgeInsets.all(10.0),
      height: MediaQuery.of(context).size.height * 0.4,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(5.0)),
        color: Colors.white,
      ),
      child: LayoutBuilder(builder: (context, constraints) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              _quizPageController.lsQuestion[indexQuestion].questiontext!,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: Image.network(
                  _quizPageController.lsQuestion[indexQuestion].questionimg!),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        );
      }),
    );
  }
}

