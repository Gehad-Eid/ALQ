import 'package:alqgp/Src/Models/bookmarkFolder_model.dart';
import 'package:alqgp/Src/Services/database_repo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BookmarksFolderController extends GetxController {
  static BookmarksFolderController get instance => Get.find();

  final _databaseRepo = Get.put(DatabaseRepository());

  final FolderTitle = TextEditingController();

  final List<Color> predefinedColors = [
    Color(0xfffafafa), // canvas
    Color(0xfffa8072), // salmon
    Color(0xfffedc56), // mustard
    Color(0xffd0f0c0), // tea
    Color(0xfffca3b7), // flamingo
    Color(0xff997950), // tortilla
    Color(0xfffffdd0), // cream
  ];

  RxInt choosenColor = 0.obs;
  RxList<bookmarkFolder> foldersList = RxList<bookmarkFolder>();
  List<bookmarkFolder> get folders => foldersList;

  @override
  void onInit() {
    super.onInit();
    // stream the folders from data base to keep track of the changes
    foldersList.bindStream(_databaseRepo.getBookmarkFolders());
  }

  // add a new folder
  void addFolder(String title) {
    _databaseRepo.addBookmarkFolders(
        title, predefinedColors[choosenColor.value].value);
    choosenColor.value = 0;
  }

  // keep a track of the selected color by the user
  void getColor(int index) {
    choosenColor.value = index;
  }
}
