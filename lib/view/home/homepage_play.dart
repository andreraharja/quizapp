import 'package:flutter/material.dart';
import 'package:quizapp/controller/homepage_controller.dart';

class HomePagePlay extends StatelessWidget {
  const HomePagePlay({
    Key? key,
    required HomePageController homePageController,
  }) : _homePageController = homePageController, super(key: key);

  final HomePageController _homePageController;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        _homePageController.toQuizPage();
      },
      child: Container(
        height: MediaQuery.of(context).size.height * 0.07,
        width: MediaQuery.of(context).size.width * 0.7,
        decoration: BoxDecoration(
          color: Colors.lightBlue,
          border: Border.all(
            color: Colors.lightBlue,
            style: BorderStyle.solid,
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: Center(
          child: Text(
            "PLAY",
            style: Theme.of(context)
                .textTheme
                .button!
                .apply(color: Colors.white),
          ),
        ),
      ),
    );
  }
}