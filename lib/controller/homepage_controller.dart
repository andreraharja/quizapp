import 'dart:math';

import 'package:get/get.dart';
import 'package:quizapp/view/quiz/quiz_page.dart';
import 'package:quizapp/view/topics/topic_page.dart';

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
}
