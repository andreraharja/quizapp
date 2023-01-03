import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:quizapp/model/m_answer.dart';
import 'package:quizapp/model/m_question.dart';
import 'package:quizapp/model/m_topic.dart';

class FirestoreServices {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  Future<List<MTopic>> getDataTopic(String txtSearch) async {
    List<MTopic> dataResult = [];
    QuerySnapshot? querySnapshot;
    if (txtSearch != "") {
      querySnapshot = await firebaseFirestore
          .collection('topics')
          .orderBy("topicname")
          .where("keyword", isEqualTo: txtSearch.toUpperCase())
          .get();
    } else {
      querySnapshot = await firebaseFirestore
          .collection('topics')
          .orderBy("topicname")
          .get();
    }
    for (var res in querySnapshot.docs) {
      dataResult.add(MTopic(
          topicid: res['topicid'],
          topicname: res['topicname'],
          keyword: res['keyword']));
    }
    return dataResult;
  }

  Future<List<MQuestion>> getDataQuestion(int topicId) async {
    List<MQuestion> dataResult = [];
    QuerySnapshot querySnapshot = await firebaseFirestore
        .collection('questions')
        .orderBy("questionid")
        .where("topicid", isEqualTo: topicId)
        .get();
    for (var res in querySnapshot.docs) {
      dataResult.add(MQuestion(
          topicid: res['topicid'],
          questionid: res['questionid'],
          questiontext: res['questiontext'],
          questionimg: res['questionimg']));
    }
    return dataResult;
  }

  Future<List<MAnswer>> getDataAnswer(int topicId) async {
    List<MAnswer> dataResult = [];
    QuerySnapshot querySnapshot = await firebaseFirestore
        .collection('answers')
        .where("topicid", isEqualTo: topicId)
        .get();
    for (var res in querySnapshot.docs) {
      dataResult.add(MAnswer(
          topicid: res['topicid'],
          questionid: res['questionid'],
          answertext: res['answertext'],
          score: res['score']));
    }
    return dataResult;
  }
}
