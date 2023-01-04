import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:quizapp/view/quiz/quiz_page.dart';
import 'package:quizapp/view/topics/topic_page.dart';
import 'package:share_plus/share_plus.dart';

import '../model/m_topic.dart';
import '../services/firestore_services.dart';

class HomePageController extends GetxController {
  Future<void> toQuizPage() async {
    List<MTopic> lsTopic = [];
    lsTopic = await FirestoreServices().getDataTopic("");
    Random random = Random();
    int topicId = random.nextInt(lsTopic.length) + 1;
    Get.to(() => QuizPage(), arguments: {"topicid": topicId});
  }

  void toTopicPage() {
    Get.to(() => TopicPage());
  }

  void shareLink() {
    Share.share(
        'Visit Source Code QuizApp at https://github.com/andreraharja/quizapp');
  }

  void dialogRate() {
    Get.bottomSheet(Container(
      color: Colors.white,
      height: Get.height * 0.15,
      child: Center(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text('Rate Us'),
            ),
            RatingBar.builder(
              initialRating: 0,
              minRating: 1,
              direction: Axis.horizontal,
              itemCount: 5,
              itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
              itemBuilder: (context, _) => const Icon(
                Icons.star,
                color: Colors.amber,
              ),
              onRatingUpdate: (rating) {
                Future.delayed(const Duration(milliseconds: 600), () {
                  Get.back();
                });
              },
            ),
          ],
        ),
      ),
    ));
  }
}
