import 'package:alqgp/Src/Models/lesson_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:get/get.dart';

import '../Screens/Authorized/Lessons/lesson.dart';
import 'chapter_controller.dart';

class LessonController extends GetxController {
  static LessonController get instance => Get.find();

  //prameter for this page
  final lesson lessonContent = Get.arguments["lessonData"];
  final List<lesson> lessonsList = Get.arguments["lessonsList"];
  final int currentLessonIndex = Get.arguments["currentIndex"];

  // TTS instence
  FlutterTts flutterTts = FlutterTts();

  // varibles
  final pageController = PageController();
  RxInt currentPage = 0.obs;
  RxBool next = false.obs;
  RxBool tts = true.obs;

  @override
  void onInit() {
    super.onInit();
    initTts();
  }

  @override
  void dispose() {
    super.dispose();
    flutterTts.stop();
  }

  initTts() {
    _setAwaitOptions();
    flutterTts.setCompletionHandler(() {
      tts.value = true;
    });
  }

  showNextButton() {
    next = RxBool(currentPage >= lessonContent.parts!.length - 1);
  }

  nextLesson() {
    if (currentLessonIndex + 1 >= lessonsList.length) {
      Get.back();
    } else {
      // ******** not working
      Get.off(Lesson(), arguments: {
        "lessonData": lessonsList[currentLessonIndex + 1],
        "lessonsList": currentLessonIndex + 1,
        "currentIndex": currentLessonIndex + 1,
      });
    }
  }

  onPageChangedCallback(int activePageIndex) {
    currentPage.value = activePageIndex;
  }

  Future _setAwaitOptions() async {
    await flutterTts.awaitSpeakCompletion(true);
  }

  void startTTS(text) async {
    await flutterTts.setVolume(1);
    await flutterTts.setSpeechRate(0.5);
    await flutterTts.setPitch(1);
    await flutterTts.setLanguage("en-US");
    tts.value = false;
    await flutterTts.speak(text);
  }

  void pauseTTS() async {
    tts.value = false;
    await flutterTts.pause();
    tts.value = true;
  }

  void stoptTTS() async {
    tts.value = false;
    await flutterTts.stop();
    tts.value = true;
  }
}
