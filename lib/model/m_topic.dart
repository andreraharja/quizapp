class MTopic {
  int? topicid;
  String? topicname;
  String? keyword;

  MTopic({this.topicid, this.topicname, this.keyword});

  MTopic.fromJson(Map<String, dynamic> json) {
    topicid = json['topicid'];
    topicname = json['topicname'];
    keyword = json['keyword'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['topicid'] = topicid;
    data['topicname'] = topicname;
    data['keyword'] = keyword;
    return data;
  }
}