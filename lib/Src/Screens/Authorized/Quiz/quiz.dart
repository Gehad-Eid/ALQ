import 'package:alqgp/Src/Utils/Consts/consts.dart';
import 'package:alqgp/Src/controllers/quiz_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'questionAndAnswersAndNext.dart';
import 'scoreArea.dart';
import 'widgets/quizAppBar.dart';

class quiz extends StatelessWidget {
  const quiz({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SafeArea(
      child: GetX<QuizController>(
        init: Get.put<QuizController>(QuizController()),
        builder: (QuizController quizController) {
          if (quizController != null && quizController.questions != null) {
            if (quizController.currentQuestionIndex.value <
                quizController.questions.length - 1) {
              // shuffling the answers to get a arondom answers order each time
              quizController
                  .questions[quizController.currentQuestionIndex.value].answers!
                  .shuffle();

              return Stack(children: [
                // background
                Container(
                  height: size.height,
                  width: size.width,
                  color: tPrimaryColor,
                ),

                // app bar
                quizAppBar(size, context, quizController),

                // question builder and Next button
                questionAndAnswersAndNext(size, quizController, context),
              ]);
            } else {
              // answers check
              return Stack(
                children: [
                  // background
                  Container(
                    height: size.height,
                    width: size.width,
                    color: tPrimaryColor,
                  ),

                  // score area
                  scoreArea(size, quizController, context),
                ],
              );
            }
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
