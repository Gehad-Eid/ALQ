import 'package:cloud_firestore/cloud_firestore.dart';

class Bookmark {
  String? id;
  String lessonID, name;
  int chapterNum;

  Bookmark({
    this.id,
    required this.name,
    required this.lessonID,
    required this.chapterNum,
  });

  // Map bookmark fetched from Firebase to Bookmark model
  factory Bookmark.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;

    return Bookmark(
      id: document.id,
      name: data["name"],
      lessonID: data["lessonID"],
      chapterNum: data["chapterNum"],
    );
  }

  // Map bookmark data from bookmark Model to a map (json form)
  toJson() {
    return {
      "name": name,
      "lessonID": lessonID,
      "chapterNum": chapterNum,
    };
  }
}
