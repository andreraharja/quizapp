import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizapp/controller/result_controller.dart';
import 'package:quizapp/view/result/result_page_chart.dart';
import 'package:quizapp/view/result/result_page_summary.dart';

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
                  ResultPageChart(resultPageController: _resultPageController),
                  const SizedBox(
                    height: 10,
                  ),
                  resultShare(),
                  const SizedBox(
                    height: 30,
                  ),
                  resultYourReport(context),
                  const SizedBox(
                    height: 20,
                  ),
                  ResultPageSummary(resultPageController: _resultPageController)
                ],
              )),
        ));
  }

  Widget resultShare() {
    return ElevatedButton(
        onPressed: () {
          _resultPageController.shareScore();
        },
        child: const Text('Share Your Score'));
  }

  Widget resultYourReport(BuildContext context) {
    return Text(
      'Your Report',
      style: Theme.of(context)
          .textTheme
          .titleLarge!
          .apply(color: Colors.white, fontWeightDelta: 1),
    );
  }
}
