import 'package:flutter/material.dart';
import 'package:quizapp/controller/homepage_controller.dart';

class HomePageShare extends StatelessWidget {
  const HomePageShare({
    Key? key,
    required HomePageController homePageController,
  }) : _homePageController = homePageController, super(key: key);

  final HomePageController _homePageController;

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
        onPressed: () {
          _homePageController.shareLink();
        },
        icon: const Icon(Icons.share),
        label: const Text(
          'Share',
          style: TextStyle(color: Colors.white),
        ));
  }
}