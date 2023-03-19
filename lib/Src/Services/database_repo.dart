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

  // add a Bookmark Folders
  Future<void> addBookmarkFolders(String title, int color) async {
    final uid = _authRepo.firebaseUser.value?.uid;
    final snapshot =
        await _db.collection("Users").doc(uid).collection("bookmarks").add({
      "title": title,
      "bgColor": color,
      "btnColor": color,
      "iconColor": color,
    });
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

  //get the Bookmark's lessons
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

  // delete bookmark

  // add to bookmarks
  Future<void> addBookmark(String id, int chapterNum, String folderID) async {
    final uid = _authRepo.firebaseUser.value?.uid;
    final snapshot = await _db
        .collection("Users")
        .doc(uid)
        .collection("bookmarks")
        .doc(folderID)
        .collection("lessons")
        .add({
      "lessonID": id,
      "chapterNum": chapterNum,
    });
  }

  Future<bool> checkExist(String docID, String folderID) async {
    final uid = _authRepo.firebaseUser.value?.uid;
    bool exist = false;
    await _db
        .collection("Users")
        .doc(uid)
        .collection("bookmarks")
        .doc(folderID)
        .collection("lessons")
        .doc(docID)
        .get()
        .then((doc) {
      exist = doc.exists;
    });
    return exist;
  }
  //delete a bookmark folder
}
