class MQuestion {
  int? topicid;
  int? questionid;
  String? questiontext;
  String? questionimg;

  MQuestion({this.topicid, this.questionid, this.questiontext, this.questionimg});

  MQuestion.fromJson(Map<String, dynamic> json) {
    topicid = json['topicid'];
    questionid = json['questionid'];
    questiontext = json['questiontext'];
    questionimg = json['questionimg'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['topicid'] = topicid;
    data['questionid'] = questionid;
    data['questiontext'] = questiontext;
    data['questionimg'] = questionimg;
    return data;
  }
}