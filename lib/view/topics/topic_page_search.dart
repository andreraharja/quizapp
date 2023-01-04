import 'package:flutter/material.dart';
import 'package:quizapp/controller/topic_controller.dart';

class TopicPageSearch extends StatelessWidget {
  const TopicPageSearch({
    Key? key,
    required TopicController topicController,
  })  : _topicController = topicController,
        super(key: key);

  final TopicController _topicController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
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
    );
  }
}
