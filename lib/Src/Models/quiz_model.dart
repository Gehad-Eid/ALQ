import 'package:cloud_firestore/cloud_firestore.dart';

class Quiz {
  String? id, question, correct;
  List<String>? answers;

  Quiz({this.id, this.question, this.answers, this.correct});

  factory Quiz.fromsnapshot(DocumentSnapshot<Map<String, dynamic>> snapshot) {
    final data = snapshot.data();
    return Quiz(
      id: snapshot.id,
      question: data?['question'],
      correct: data?['correct'],
      answers:
          data?['answers'] is Iterable ? List.from(data?['answers']) : null,
    );
  }
}
