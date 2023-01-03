class MAnswer {
  int? topicid;
  int? questionid;
  String? answertext;
  int? score;

  MAnswer({this.topicid, this.questionid, this.answertext, this.score});

  MAnswer.fromJson(Map<String, dynamic> json) {
    topicid = json['topicid'];
    questionid = json['questionid'];
    answertext = json['answertext'];
    score = json['score'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['topicid'] = topicid;
    data['questionid'] = questionid;
    data['answertext'] = answertext;
    data['score'] = score;
    return data;
  }
}