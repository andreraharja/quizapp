import 'package:flutter/material.dart';
import 'package:quizapp/controller/homepage_controller.dart';

class HomePageRate extends StatelessWidget {
  const HomePageRate({
    Key? key,
    required HomePageController homePageController,
  }) : _homePageController = homePageController, super(key: key);

  final HomePageController _homePageController;

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
        onPressed: () {
          _homePageController.dialogRate();
        },
        icon: const Icon(
          Icons.star_rate,
          color: Colors.yellow,
        ),
        label: const Text(
          'Rate Us',
          style: TextStyle(color: Colors.white),
        ));
  }
}