import 'package:flutter/material.dart';
import 'package:quizapp/controller/result_controller.dart';

class ResultPageSummary extends StatelessWidget {
  const ResultPageSummary({
    Key? key,
    required ResultPageController resultPageController,
  }) : _resultPageController = resultPageController, super(key: key);

  final ResultPageController _resultPageController;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ListView.builder(
            itemCount: _resultPageController.lsQuestion.length,
            itemBuilder: (context, index) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  resultQuestion(index, context),
                  resultAnswer(index, context),
                  const SizedBox(
                    height: 15,
                  )
                ],
              );
            }));
  }

  Widget resultAnswer(int index, BuildContext context) {
    return Row(
                  children: [
                    _resultPageController.lsAnswer[index].score ==
                        1
                        ? const Icon(
                      Icons.check,
                      color: Colors.green,
                    )
                        : const Icon(
                      Icons.clear,
                      color: Colors.red,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      _resultPageController
                          .lsAnswer[index].answertext!,
                      style: Theme.of(context)
                          .textTheme
                          .titleSmall!
                          .apply(color: Colors.white),
                    ),
                    _resultPageController.lsAnswer[index].score ==
                        0
                        ? Row(
                      children: [
                        const SizedBox(
                          width: 10,
                        ),
                        const Icon(
                          Icons.check,
                          color: Colors.green,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                            _resultPageController
                                .lsCorrect[index]
                                .answertext!,
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .apply(
                                color: Colors.white)),
                      ],
                    )
                        : Container(),
                  ],
                );
  }

  Widget resultQuestion(int index, BuildContext context) {
    return Text(
                  _resultPageController
                      .lsQuestion[index].questiontext!,
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .apply(color: Colors.white),
                );
  }
}

