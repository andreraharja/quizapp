import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizapp/controller/topic_controller.dart';
import 'package:quizapp/view/topics/topic_page_listview.dart';
import 'package:quizapp/view/topics/topic_page_search.dart';

class TopicPage extends StatelessWidget {
  TopicPage({Key? key}) : super(key: key);
  final TopicController _topicController = Get.put(TopicController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Topics'),
        centerTitle: true,
        backgroundColor: Colors.blue.shade900,
        elevation: 0,
      ),
      body: Container(
        color: Colors.blue.shade900,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              TopicPageSearch(topicController: _topicController),
              const SizedBox(
                height: 20,
              ),
              TopicPageListView(topicController: _topicController),
            ],
          ),
        ),
      ),
    );
  }
}
