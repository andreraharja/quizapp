import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:quizapp/model/m_topic.dart';
import 'package:quizapp/services/firestore_services.dart';
import 'package:quizapp/view/quiz/quiz_page.dart';

class TopicController extends GetxController {
  var isLoading = true.obs;
  var lsTopic = List<MTopic>.empty().obs;
  var ctrlSearch = TextEditingController().obs;

  @override
  void onInit() {
    retrieveData("");
    super.onInit();
  }

  void retrieveData(String txtSearch) async {
    isLoading(true);
    lsTopic.value = await FirestoreServices().getDataTopic(txtSearch);
    isLoading(false);
  }

  void toQuizPage(int topicId) {
    Get.off(() => QuizPage(), arguments: {"topicid": topicId});
  }
}
