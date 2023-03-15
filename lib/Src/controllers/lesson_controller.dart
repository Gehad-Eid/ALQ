import 'package:alqgp/Src/Models/lesson_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LessonController extends GetxController {
  static LessonController get instance => Get.find();

  final lesson lessonContent = Get.arguments;

  final pageController = PageController();
  RxInt currentPage = 0.obs;
  RxBool next = false.obs;

  onPageChangedCallback(int activePageIndex) {
    currentPage.value = activePageIndex;
    // print(currentPage.value);
  }

  showNextButton() {
    next = RxBool(currentPage >= lessonContent.parts!.length - 1);
  }
}
