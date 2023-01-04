import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:quizapp/controller/result_controller.dart';

class ResultPage extends StatelessWidget {
  ResultPage({Key? key}) : super(key: key);
  final ResultPageController _resultPageController =
      Get.put(ResultPageController(Get.arguments));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Your Score'),
          centerTitle: true,
          backgroundColor: Colors.blue.shade900,
          elevation: 0,
        ),
        body: RepaintBoundary(
          key: _resultPageController.statusBoundary,
          child: Container(
              color: Colors.blue.shade900,
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  PieChart(
                    dataMap: _resultPageController.dataChart,
                    chartRadius: MediaQuery.of(context).size.width * 0.25,
                    colorList: const [Colors.green, Colors.red],
                    chartType: ChartType.ring,
                    ringStrokeWidth: 5,
                    centerTextStyle: TextStyle(fontSize: MediaQuery.of(context).size.width * 0.04),
                    centerText:
                        _resultPageController.correctAnswer.value.toString() +
                            " / " +
                            _resultPageController.lsQuestion.length.toString(),
                    legendOptions: const LegendOptions(
                      showLegends: false,
                    ),
                    chartValuesOptions: const ChartValuesOptions(
                      showChartValueBackground: false,
                      showChartValues: false,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        _resultPageController.shareScore();
                      }, child: const Text('Share Your Score')),
                  const SizedBox(
                    height: 30,
                  ),
                  Text(
                    'Your Report',
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge!
                        .apply(color: Colors.white, fontWeightDelta: 1),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Expanded(
                      child: ListView.builder(
                          itemCount: _resultPageController.lsQuestion.length,
                          itemBuilder: (context, index) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  _resultPageController
                                      .lsQuestion[index].questiontext!,
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium!
                                      .apply(color: Colors.white),
                                ),
                                Row(
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
                                ),
                                const SizedBox(
                                  height: 15,
                                )
                              ],
                            );
                          }))
                ],
              )),
        ));
  }
}
