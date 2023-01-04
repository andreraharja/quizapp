import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizapp/controller/topic_controller.dart';

class TopicPageListView extends StatelessWidget {
  const TopicPageListView({
    Key? key,
    required TopicController topicController,
  })  : _topicController = topicController,
        super(key: key);

  final TopicController _topicController;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Obx(() => ListView.builder(
          itemCount: _topicController.lsTopic.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                _topicController
                    .toQuizPage(_topicController.lsTopic[index].topicid!);
              },
              child: Container(
                padding: const EdgeInsets.all(15.0),
                margin: const EdgeInsets.only(bottom: 10.0),
                decoration: BoxDecoration(color: Colors.blue.shade800),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      _topicController.lsTopic[index].topicname!,
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge!
                          .apply(color: Colors.white70),
                    ),
                    const Icon(Icons.arrow_right, color: Colors.white70),
                  ],
                ),
              ),
            );
          })),
    );
  }
}