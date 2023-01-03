import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Your Score'),
          centerTitle: true,
          backgroundColor: Colors.blue.shade900,
          elevation: 0,
        ),
        body: const Text('Your Report'));
  }
}
