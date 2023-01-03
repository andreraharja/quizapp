import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizapp/controller/topic_controller.dart';

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
              TextFormField(
                controller: _topicController.ctrlSearch.value,
                decoration: InputDecoration(
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  fillColor: Colors.white,
                  filled: true,
                  hintText: 'Find Topic',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(
                      Icons.search,
                      color: Colors.blue.shade900,
                    ),
                    onPressed: () {
                      _topicController
                          .retrieveData(_topicController.ctrlSearch.value.text);
                    },
                  ),
                ),
                onChanged: (value) {
                  if (value == "") {
                    _topicController.retrieveData(value);
                  }
                },
                onFieldSubmitted: (value) {
                  _topicController.retrieveData(value);
                },
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                child: Obx(() => ListView.builder(
                    itemCount: _topicController.lsTopic.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          _topicController.toQuizPage(
                              _topicController.lsTopic[index].topicid!);
                        },
                        child: Container(
                          padding: const EdgeInsets.all(15.0),
                          margin: const EdgeInsets.only(bottom: 10.0),
                          decoration:
                              BoxDecoration(color: Colors.blue.shade800),
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
                              const Icon(Icons.arrow_right,
                                  color: Colors.white70),
                            ],
                          ),
                        ),
                      );
                    })),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
