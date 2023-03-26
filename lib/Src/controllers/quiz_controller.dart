import 'dart:math';

import 'package:alqgp/Src/Models/quiz_model.dart';
import 'package:alqgp/Src/Services/database_repo.dart';
import 'package:get/get.dart';

class QuizController extends GetxController {
  static QuizController get instance => Get.find();

  final _databaseRepo = Get.put(DatabaseRepository());

  final int chapterNum = Get.arguments;

  RxList<Quiz> questionsList = RxList<Quiz>();
  List<Quiz> get questions => questionsList;
  RxInt currentQuestionIndex = 0.obs;

  RxList<int> selectedAnswers = RxList<int>.filled(10, -1, growable: true);
  List<int> get answers => selectedAnswers;

  RxList<int> scoreList = RxList<int>.filled(10, -1, growable: true);
  List<int> get scores => scoreList;

  List<int> indexs = List<int>.filled(2, -1, growable: true);
  RxBool delete = true.obs;

  double presentage = 0.0;
  String photo = "";
  String what2do = "somthing went wrong";

  @override
  void onInit() {
    super.onInit();
    // the questions from data base to keep track of the changes
    questionsList.bindStream(_databaseRepo.getQuestions(chapterNum));
  }

  updateScore() {
    int sum = 0;
    for (int i = 0; i < scores.length; i++) {
      if (scores[i] != -1) {
        sum += scores[i];
      }
    }
    presentage = sum / questions.length;
    _databaseRepo.updateChapterScore(sum, chapterNum);
    return sum;
  }

// defines the grade ot the user and what too write in the UI
  ABC() {
    if (presentage >= 0.8) {
      photo = "images/rating.png";
      what2do = " WoW you nailed it";
      return "Perfect";
    } else if (presentage >= 0.5) {
      photo = "images/star.png";
      what2do = "oh yeah, you got that";
      return "Good";
    } else {
      photo = "images/star.png";
      what2do = "oooh, you can do better";
      return "Oh No";
    }
  }

// keeps track on the selected answers by the user to change its color
  setSelectedAnswer(int index) {
    selectedAnswers[currentQuestionIndex.value] = index;
    print("the sssss selectd : $selectedAnswers");
  }

// moves the quiz ti hte next user
  next() {
    currentQuestionIndex.value = currentQuestionIndex.value + 1;
    delete.value = true;
    update();
  }

// keeps track on the user's score
  isCorrect(int score) {
    scoreList[currentQuestionIndex.value] = score;
    print("the kkkkk scores : $scores");
  }

// a counter for the question numbers
  questionNumber() {
    return currentQuestionIndex.value + 1;
  }

// get the length based on the the delete 2 answers hint
  getlength(bool NotdeleteAnswers) {
    if (NotdeleteAnswers) {
      return questions[currentQuestionIndex.value].answers!.length;
    } else {
      for (int i = 0;
          i < questionsList[currentQuestionIndex.value].answers!.length;
          i++) {
        if (questionsList[currentQuestionIndex.value].answers![i] ==
            questionsList[currentQuestionIndex.value].correct) {
          indexs[0] = i;
        }
      }

      late int rng;
      bool notIt = true;
      while (notIt) {
        rng = Random()
            .nextInt(questionsList[currentQuestionIndex.value].answers!.length);
        if (rng != indexs[0]) {
          notIt = false;
        }
      }
      indexs[1] = rng;
      indexs.shuffle();
      return indexs.length;
    }
  }
}
