import 'package:cloud_firestore/cloud_firestore.dart';

class lesson {
  String? id, nameAndModle;
  // bool? bookmarked;
  List<String>? parts;

  lesson({this.id, this.nameAndModle, this.parts});

  factory lesson.fromsnapshot(DocumentSnapshot<Map<String, dynamic>> snapshot) {
    final data = snapshot.data();
    return lesson(
      id: snapshot.id,
      // bookmarked: data?['bookmarked'],
      nameAndModle: data?['nameAndModle'],
      parts: data?['parts'] is Iterable ? List.from(data?['parts']) : null,
    );
  }
}
