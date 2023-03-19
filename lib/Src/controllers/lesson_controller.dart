import 'package:alqgp/Src/Models/lesson_model.dart';
import 'package:alqgp/Src/Services/database_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:get/get.dart';

class LessonController extends GetxController {
  static LessonController get instance => Get.find();

  final _databaseRepo = Get.put(DatabaseRepository());

  //prameter for this page
  final lesson lessonContent = Get.arguments["lessonData"];
  final List<lesson> lessonsList = Get.arguments["lessonsList"];
  final int currentLessonIndex = Get.arguments["currentIndex"];
  final int chapterNum = Get.arguments["chapterNum"];

  // TTS instence
  FlutterTts flutterTts = FlutterTts();

  // varibles
  final pageController = PageController();
  // final folderName = TextEditingController();
  RxBool bookmarked = false.obs;
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

  // update the next value
  showNextButton() {
    next.value = currentPage >= lessonContent.parts!.length - 1;
  }

  // direct the user to next lesson
  nextLesson() {
    if (currentLessonIndex + 1 >= lessonsList.length) {
      Get.back();
    } else {
      Get.delete<LessonController>(force: true);
      Get.offAndToNamed("/lesson", arguments: {
        "lessonData": lessonsList[currentLessonIndex + 1],
        "lessonsList": lessonsList,
        "currentIndex": currentLessonIndex + 1,
        "chapterNum": chapterNum,
      });
    }
  }

  onPageChangedCallback(int activePageIndex) {
    currentPage.value = activePageIndex;
  }

  // Add a bookmark **************
  // addBookmark() {
  //   _databaseRepo.addBookmark(lessonContent.id!, chapterNum, folderName.text);
  // }

  addBookmarkWithFolderID(String folder) {
    _databaseRepo.addBookmark(lessonContent.id!, chapterNum, folder);
  }

  // check if it's in the bookmarks
  bool isBookmarked() {
    return bookmarked.value;
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
