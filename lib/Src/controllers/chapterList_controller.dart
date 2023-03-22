import 'package:alqgp/Src/Models/chapter_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Services/database_repo.dart';

class ChapterListController extends GetxController {
  static ChapterListController get instance => Get.find();

  final _databaseRepo = Get.put(DatabaseRepository());
  RxList<Chapter> chaptersList = RxList<Chapter>();
  List<Chapter> get chapters => chaptersList;

  @override
  void onInit() {
    super.onInit();
    // the chapters from data base to keep track of the changes
    chaptersList.bindStream(_databaseRepo.getChapters());
  }
}
