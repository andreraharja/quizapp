import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizapp/controller/homepage_controller.dart';

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
            Image.asset(
              "assets/idea.png",
              height: MediaQuery.of(context).size.height * 0.15,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            Text(
              'Flutter Quiz App',
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .apply(color: Colors.white, fontWeightDelta: 1),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              'Learn . Take Quiz . Repeat',
              style: Theme.of(context)
                  .textTheme
                  .caption!
                  .apply(color: Colors.white),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
            ),
            InkWell(
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
            ),
            const SizedBox(
              height: 10,
            ),
            InkWell(
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
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.share),
                    label: const Text(
                      'Share',
                      style: TextStyle(color: Colors.white),
                    )),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.1,
                ),
                TextButton.icon(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.star_rate,
                      color: Colors.yellow,
                    ),
                    label: const Text(
                      'Rate Us',
                      style: TextStyle(color: Colors.white),
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
