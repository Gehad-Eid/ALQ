import 'package:alqgp/Src/Models/achievements_model.dart';
import 'package:alqgp/Src/Models/bookmarkFolder_model.dart';
import 'package:alqgp/Src/Models/bookmark_model.dart';
import 'package:alqgp/Src/Models/chapter_model.dart';
import 'package:alqgp/Src/Models/lesson_model.dart';
import 'package:alqgp/Src/Models/quiz_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'auth_repo.dart';

class DatabaseRepository extends GetxController {
  static DatabaseRepository get instance => Get.find();

  final _authRepo = Get.put(AuthenticationRepository());

  final _db = FirebaseFirestore.instance;

  // get the chapters
  Stream<List<Chapter>> getChapters() {
    return _db.collection("chapters").snapshots().map((data) {
      List<Chapter> chapters = [];
      data.docs.forEach((element) {
        chapters.add(Chapter.fromSnapshot(element));
      });
      return chapters;
    });
  }

  //get the chapter's lessons
  // Future<List<lesson>> getLessons(int chapterNumper) async {
  //   final snapshot = await _db
  //       .collection("chapters")
  //       .doc("Chapter $chapterNumper")
  //       .collection("Lessons")
  //       .get();
  //   final lessonData =
  //       snapshot.docs.map((data) => lesson.fromsnapshot(data)).toList();

  //   return lessonData;
  // }

  Stream<List<lesson>> getLessons(int chapterNumper) {
    return _db
        .collection("chapters")
        .doc("Chapter $chapterNumper")
        .collection("Lessons")
        .snapshots()
        .map((data) {
      List<lesson> lessons = [];
      data.docs.forEach((element) {
        lessons.add(lesson.fromsnapshot(element));
      });
      return lessons;
    });
  }

  // add a Bookmark Folders
  Future<void> addBookmarkFolders(String title, int color) async {
    final uid = _authRepo.firebaseUser.value?.uid;
    final snapshot =
        await _db.collection("Users").doc(uid).collection("bookmarks").add({
      "title": title,
      "bgColor": color,
      "btnColor": color,
      "iconColor": color,
      "count": 0,
    });
  }

//delete a bookmark folder
  Future<void> deleteBookmarkFolder(String folderID) async {
    final uid = _authRepo.firebaseUser.value?.uid;
    await _db
        .collection("Users")
        .doc(uid)
        .collection("bookmarks")
        .doc(folderID)
        .delete();
  }

  //get the Bookmark's Folders
  Stream<List<bookmarkFolder>> getBookmarkFolders() {
    final uid = _authRepo.firebaseUser.value?.uid;
    return _db
        .collection("Users")
        .doc(uid)
        .collection("bookmarks")
        .orderBy("title")
        .snapshots()
        .map((data) {
      List<bookmarkFolder> folders = [];
      data.docs.forEach((element) {
        folders.add(bookmarkFolder.fromSnapshot(element));
      });
      folders.add(bookmarkFolder(isLast: true));
      return folders;
    });
  }

  // add to bookmark
  Future<void> addBookmark(String id, int chapterNum, String folderID,
      String name, int count) async {
    final uid = _authRepo.firebaseUser.value?.uid;
    final snapshot = await _db
        .collection("Users")
        .doc(uid)
        .collection("bookmarks")
        .doc(folderID)
        .collection("lessons")
        .add({
      "name": name,
      "lessonID": id,
      "chapterNum": chapterNum,
    });

    final snapshot1 = await _db
        .collection("Users")
        .doc(uid)
        .collection("bookmarks")
        .doc(folderID)
        .update({
      "count": count,
    });
  }

  // delete bookmark
  Future<void> deleteBookmark(String folderID, String docID) async {
    final uid = _authRepo.firebaseUser.value?.uid;
    await _db
        .collection("Users")
        .doc(uid)
        .collection("bookmarks")
        .doc(folderID)
        .collection("lessons")
        .doc(docID)
        .delete();
  }

  //get the Bookmark folder's lessons
  Stream<List<Bookmark>> getBookmarksLessons(String folderID) {
    final uid = _authRepo.firebaseUser.value?.uid;
    return _db
        .collection("Users")
        .doc(uid)
        .collection("bookmarks")
        .doc(folderID)
        .collection("lessons")
        .snapshots()
        .map((data) {
      List<Bookmark> lessons = [];
      data.docs.forEach((element) {
        lessons.add(Bookmark.fromSnapshot(element));
      });
      return lessons;
    });
  }

  // check if the bookmark has lessons
  Future<bool> hasNotLessons(String folderID) async {
    final uid = _authRepo.firebaseUser.value?.uid;
    final snabshot = await _db
        .collection("Users")
        .doc(uid)
        .collection("bookmarks")
        .doc(folderID)
        .collection("lessons")
        .get();
    return snabshot.size == 0;
  }

  // check if the lesson is bookmarked
  Future<void> chageBookmarked(
      bool isbookmarked, String lessonID, int chapterNum) async {
    await _db
        .collection("chapters")
        .doc("Chapter $chapterNum")
        .collection("Lessons")
        .doc(lessonID)
        .update({"bookmarked": !isbookmarked});
  }

  // get the chapter's Questions
  Stream<List<Quiz>> getQuestions(int chapterNumper) {
    return _db
        .collection("chapters")
        .doc("Chapter $chapterNumper")
        .collection("Quiz")
        .snapshots()
        .map((data) {
      List<Quiz> questions = [];
      data.docs.forEach((element) {
        questions.add(Quiz.fromsnapshot(element));
      });
      questions.shuffle();
      return questions;
    });
  }

//updates the user's score
  Future<void> updateChapterScore(int sum, int chapterNum) async {
    final uid = _authRepo.firebaseUser.value?.uid;
    await _db.collection("Users").doc(uid).update({
      "score": sum,
      "ch${chapterNum}status": true,
      "ch${chapterNum}quiz": true,
    });
  }

//updates the Achievements for the user
  Future<void> updateAchievement(
      int score, String chapterName, String photo, String title) async {
    final uid = _authRepo.firebaseUser.value?.uid;
    await _db.collection("Users").doc(uid).collection("Scores").add({
      "title": title,
      "chapterName": chapterName,
      "photo": photo,
      "score": score,
    });
  }

// Streams the Achievements from db
  Stream<List<Achievement>> getAchievement() {
    final uid = _authRepo.firebaseUser.value?.uid;
    return _db
        .collection("Users")
        .doc(uid)
        .collection("Scores")
        // .orderBy("title")
        .snapshots()
        .map((data) {
      List<Achievement> achievement = [];
      data.docs.forEach((element) {
        achievement.add(Achievement.fromSnapshot(element));
      });
      return achievement;
    });
  }

// add a bug  report in the db
  Future<void> reportAbug(String title, String problem) async {
    try {
      await _db.collection('ReportABug').doc(title).set({
        'timestamp': FieldValue.serverTimestamp(),
        'ReportABug': problem,
      });
      Get.snackbar("Thank you", "The Report has been sent successfully.",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green.withOpacity(0.33),
          colorText: Colors.green);
    } catch (e) {
      Get.snackbar("error", e.toString(),
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red.withOpacity(0.3),
          colorText: Colors.red);
    }
  }

  // add a feedback in the db
  Future<void> addFeedback(String title, String problem) async {
    try {
      await _db.collection('feedback').doc(title).set({
        'timestamp': FieldValue.serverTimestamp(),
        'feedback': problem,
      });
      Get.snackbar("Thank you", "Your feedback has been sent successfully.",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green.withOpacity(0.33),
          colorText: Colors.green);
    } catch (e) {
      Get.snackbar("error", e.toString(),
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red.withOpacity(0.3),
          colorText: Colors.red);
    }
  }
}
