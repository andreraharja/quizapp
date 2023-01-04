import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/quiz_controller.dart';

class QuizPage extends StatelessWidget {
  QuizPage({Key? key}) : super(key: key);
  final QuizPageController _quizPageController =
      Get.put(QuizPageController(Get.arguments));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
      ),
      body: Obx(() => Container(
            color: Colors.blue.shade900,
            child: PageView.builder(
              physics: const NeverScrollableScrollPhysics(),
              controller: _quizPageController.mainPageController,
              itemCount: _quizPageController.lsQuestion.length,
              itemBuilder: (BuildContext context, int indexQuestion) {
                return Column(
                  children: [
                    Obx(() => Text(
                          _quizPageController.valueTimer.value.toString() + "s",
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .apply(color: Colors.white),
                        )),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
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
                              _quizPageController
                                  .lsQuestion[indexQuestion].questiontext!,
                              textAlign: TextAlign.center,
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Expanded(
                              child: Image.network(_quizPageController
                                  .lsQuestion[indexQuestion].questionimg!),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                          ],
                        );
                      }),
                    ),
                    Expanded(
                      child: Obx(() => ListView.builder(
                          itemCount: _quizPageController.lsAnswer.length,
                          itemBuilder: (context, indexAnswer) {
                            if (_quizPageController
                                    .lsAnswer[indexAnswer].questionid ==
                                _quizPageController
                                    .lsQuestion[indexQuestion].questionid) {
                              return InkWell(
                                onTap: () {
                                  _quizPageController.clickAnswer(
                                      indexQuestion + 1,
                                      _quizPageController
                                          .lsAnswer[indexAnswer]);
                                },
                                child: Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.06,
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
                                      _quizPageController
                                          .lsAnswer[indexAnswer].answertext!,
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium,
                                    ),
                                  ),
                                ),
                              );
                            } else {
                              return Container();
                            }
                          })),
                    )
                  ],
                );
              },
            ),
          )),
    );
  }
}
