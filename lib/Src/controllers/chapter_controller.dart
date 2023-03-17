import 'package:alqgp/Src/Models/chapter_model.dart';
import 'package:alqgp/Src/Models/lesson_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Services/database_repo.dart';

class ChapterController extends GetxController {
  static ChapterController get instance => Get.find();

  final _databaseRepo = Get.put(DatabaseRepository());

  final Chapter chapterContent = Get.arguments;
  final pageController = PageController();
  RxInt currentPage = 0.obs;

  onPageChangedCallback(int activePageIndex) {
    currentPage.value = activePageIndex;
  }

  Future<List<lesson>> getAllLessons() async {
    return await _databaseRepo.getLessons(chapterContent.chapNum!);
  }
}
