import 'package:alqgp/Src/Models/bookmarkFolder_model.dart';
import 'package:alqgp/Src/Models/bookmark_model.dart';
import 'package:alqgp/Src/Models/lesson_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import 'auth_repo.dart';

class DatabaseRepository extends GetxController {
  static DatabaseRepository get instance => Get.find();

  final _authRepo = Get.put(AuthenticationRepository());

  final _db = FirebaseFirestore.instance;

  //get the chapter's lessons
  Future<List<lesson>> getLessons(int chapterNumper) async {
    final snapshot = await _db
        .collection("chapters")
        .doc("Chapter $chapterNumper")
        .collection("Lessons")
        .get();
    final lessonData =
        snapshot.docs.map((data) => lesson.fromsnapshot(data)).toList();

    return lessonData;
  }

  //get the Bookmark's Folders
  Future<void> addBookmarkFolders(String title) async {
    final uid = _authRepo.firebaseUser.value?.uid;
    final snapshot =
        await _db.collection("Users").doc(uid).collection("bookmarks").add({
      "title": "som",
      "bgColor": "sin",
      "btnColor": "sim",
      "iconColor": "son",
    });
  }

  //get the Bookmark's Folders
  Future<List<bookmarkFolder>> getBookmarkFolders() async {
    final uid = _authRepo.firebaseUser.value?.uid;
    final snapshot =
        await _db.collection("Users").doc(uid).collection("bookmarks").get();

    final bookmarkFoldersData =
        snapshot.docs.map((data) => bookmarkFolder.fromSnapshot(data)).toList();

    return bookmarkFoldersData;
  }

  //get the Bookmark's lessons
  Future<List<Bookmark>> getBookmarksLessons(String folderID) async {
    final snapshot = await _db
        .collection("bookmark")
        .doc(folderID)
        .collection("lessons")
        .get();

    final bookmarkData =
        snapshot.docs.map((data) => Bookmark.fromSnapshot(data)).toList();

    return bookmarkData;
  }
}
