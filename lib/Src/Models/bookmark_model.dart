import 'package:cloud_firestore/cloud_firestore.dart';

class Bookmark {
  String lessonID;
  int chapterNum;

  Bookmark({
    required this.lessonID,
    required this.chapterNum,
  });

  // Map bookmark fetched from Firebase to Bookmark model
  factory Bookmark.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;

    return Bookmark(
      lessonID: data["lessonID"],
      chapterNum: data["chapterNum"],
    );
  }

  // Map bookmark data from bookmark Model to a map (json form)
  toJson() {
    return {
      "lessonID": lessonID,
      "chapterNum": chapterNum,
    };
  }
}
