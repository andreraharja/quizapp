import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizapp/controller/homepage_controller.dart';

import 'homepage_play.dart';
import 'homepage_rate.dart';
import 'homepage_share.dart';
import 'homepage_topic.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key}) : super(key: key);
  final HomePageController _homePageController = Get.put(HomePageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        color: Colors.blue.shade900,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            homeAssetImage(context),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            homeAppName(context),
            const SizedBox(
              height: 10,
            ),
            homeSubtitleApp(context),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
            ),
            HomePagePlay(homePageController: _homePageController),
            const SizedBox(
              height: 10,
            ),
            HomePageTopics(homePageController: _homePageController),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                HomePageShare(homePageController: _homePageController),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.1,
                ),
                HomePageRate(homePageController: _homePageController)
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget homeSubtitleApp(BuildContext context) {
    return Text(
      'Learn . Take Quiz . Repeat',
      style: Theme.of(context).textTheme.caption!.apply(color: Colors.white),
    );
  }

  Widget homeAppName(BuildContext context) {
    return Text(
      'Flutter Quiz App',
      style: Theme.of(context)
          .textTheme
          .titleMedium!
          .apply(color: Colors.white, fontWeightDelta: 1),
    );
  }

  Widget homeAssetImage(BuildContext context) {
    return Image.asset(
      "assets/idea.png",
      height: MediaQuery.of(context).size.height * 0.15,
    );
  }
}
