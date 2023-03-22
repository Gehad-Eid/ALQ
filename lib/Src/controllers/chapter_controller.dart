import 'package:alqgp/Src/Models/chapter_model.dart';
import 'package:alqgp/Src/Models/lesson_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Services/database_repo.dart';

class ChapterController extends GetxController {
  static ChapterController get instance => Get.find();

  final _databaseRepo = Get.put(DatabaseRepository());
  RxList<lesson> lesoonssList = RxList<lesson>();
  List<lesson> get lessons => lesoonssList;

  @override
  void onInit() {
    super.onInit();
    //  the lessons from data base to keep track of the changes
    lesoonssList.bindStream(_databaseRepo.getLessons(chapterContent.chapNum!));
  }

  final Chapter chapterContent = Get.arguments;
  final pageController = PageController();
  RxInt currentPage = 0.obs;

  onPageChangedCallback(int activePageIndex) {
    currentPage.value = activePageIndex;
  }
}
