import 'package:alqgp/Src/Utils/Consts/consts.dart';
import 'package:alqgp/Src/controllers/quiz_controller.dart';
import 'package:flutter/material.dart';

Positioned quizAppBar(
    Size size, BuildContext context, QuizController quizController) {
  return Positioned(
    top: size.height * 0.05,
    left: 0,
    right: 0,
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: tDefaultScreenPadding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // timer
          Container(
            child: Center(
                child: Text("09:29", // set the god danm timer
                    style: Theme.of(context).textTheme.headline5)),
          ),

          // qustion number
          Center(
            child: Text("Q ${quizController.questionNumber()}",
                style: Theme.of(context).textTheme.headline5),
          ),

          // hint icons
          Row(
            children: [
              GestureDetector(
                  onTap: () {
                    /**********  add the increase timer*/
                  },
                  child: const Icon(Icons.av_timer_outlined, size: 30)),
              SizedBox(
                width: size.width * 0.01,
              ),
              GestureDetector(
                  onTap: () {
                    quizController.delete.value = false;
                    print(quizController.delete.value);
                    quizController.update();
                  },
                  child: const Icon(Icons.delete_sweep_outlined, size: 30))
            ],
          )
        ],
      ),
    ),
  );
}
