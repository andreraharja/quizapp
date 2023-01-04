import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/quiz_controller.dart';

class QuizPageAnswer extends StatelessWidget {
  const QuizPageAnswer(
      {Key? key,
      required QuizPageController quizPageController,
      required this.indexQuestion})
      : _quizPageController = quizPageController,
        super(key: key);

  final QuizPageController _quizPageController;
  final int indexQuestion;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Obx(() => ListView.builder(
          itemCount: _quizPageController.lsAnswer.length,
          itemBuilder: (context, indexAnswer) {
            if (_quizPageController.lsAnswer[indexAnswer].questionid ==
                _quizPageController.lsQuestion[indexQuestion].questionid) {
              return InkWell(
                onTap: () {
                  _quizPageController.clickAnswer(indexQuestion + 1,
                      _quizPageController.lsAnswer[indexAnswer]);
                },
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.06,
                  margin: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      color: Colors.white,
                      style: BorderStyle.solid,
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Center(
                    child: Text(
                      _quizPageController.lsAnswer[indexAnswer].answertext!,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ),
                ),
              );
            } else {
              return Container();
            }
          })),
    );
  }
}
