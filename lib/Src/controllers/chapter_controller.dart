import 'package:alqgp/Src/Models/chapter_model.dart';
import 'package:alqgp/Src/Models/lesson_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:get/get.dart';

import '../Services/database_repo.dart';

class ChapterController extends GetxController {
  static ChapterController get instance => Get.find();

  final _databaseRepo = Get.put(DatabaseRepository());
  RxList<lesson> lesoonssList = RxList<lesson>();
  List<lesson> get lessons => lesoonssList;

  // TTS instence
  FlutterTts flutterTts = FlutterTts();
  RxBool tts = true.obs;

  @override
  void onInit() {
    initTts();
    super.onInit();
    //  the lessons from data base to keep track of the changes
    lesoonssList.bindStream(_databaseRepo.getLessons(chapterContent.chapNum!));
  }

  @override
  void dispose() {
    super.dispose();
    flutterTts.stop();
  }

  final Chapter chapterContent = Get.arguments;
  final pageController = PageController();
  RxInt currentPage = 0.obs;

  onPageChangedCallback(int activePageIndex) {
    currentPage.value = activePageIndex;
  }

  // TTS functions
  initTts() {
    _setAwaitOptions();
    flutterTts.setCompletionHandler(() {
      tts.value = true;
    });
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
    tts.value = true;
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
