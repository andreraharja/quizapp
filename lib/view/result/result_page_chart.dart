import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

import '../../controller/result_controller.dart';

class ResultPageChart extends StatelessWidget {
  const ResultPageChart({
    Key? key,
    required ResultPageController resultPageController,
  }) : _resultPageController = resultPageController, super(key: key);

  final ResultPageController _resultPageController;

  @override
  Widget build(BuildContext context) {
    return PieChart(
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
    );
  }
}