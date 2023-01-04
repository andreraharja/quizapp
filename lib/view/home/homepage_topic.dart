import 'package:flutter/material.dart';
import 'package:quizapp/controller/homepage_controller.dart';

class HomePageTopics extends StatelessWidget {
  const HomePageTopics({
    Key? key,
    required HomePageController homePageController,
  }) : _homePageController = homePageController, super(key: key);

  final HomePageController _homePageController;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        _homePageController.toTopicPage();
      },
      child: Container(
        height: MediaQuery.of(context).size.height * 0.07,
        width: MediaQuery.of(context).size.width * 0.7,
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.lightBlueAccent,
            style: BorderStyle.solid,
            width: 2.0,
          ),
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: Center(
          child: Text(
            "TOPICS",
            style: Theme.of(context)
                .textTheme
                .button!
                .apply(color: Colors.lightBlueAccent),
          ),
        ),
      ),
    );
  }
}