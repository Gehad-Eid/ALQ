import 'package:cloud_firestore/cloud_firestore.dart';

class Achievement {
  String? chapterName, title, photo, id;
  int? score;
  Achievement({
    this.id,
    this.chapterName,
    this.photo,
    this.score,
    this.title,
  });

  // Map user fetched from Firebase to chapter Model
  factory Achievement.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;

    return Achievement(
      id: document.id,
      title: data["title"],
      chapterName: data["chapterName"],
      photo: data["photo"],
      score: data["score"],
    );
  }
}
