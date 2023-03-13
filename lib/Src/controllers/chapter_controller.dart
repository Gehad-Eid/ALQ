import 'package:alqgp/Src/Models/chapter_model.dart';
import 'package:alqgp/Src/Models/lesson_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../Services/auth_repo.dart';
import '../Services/user_repo.dart';

class ChapterController extends GetxController {
  static ChapterController get instance => Get.find();

  final _authRepo = Get.put(AuthenticationRepository());
  final _userRepo = Get.put(UserRepository());

  final Chapter chapterContent = Get.arguments;
  final pageController = PageController();
  RxInt currentPage = 0.obs;

  onPageChangedCallback(int activePageIndex) {
    currentPage.value = activePageIndex;
    print(currentPage.value);
  }

  Future<List<lesson>> getAllLessons() async {
    return await _userRepo.getLessons(chapterContent.chapNum!);
  }

  userid() {
    final uid = _authRepo.firebaseUser.value?.uid;
  }
}
