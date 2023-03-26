import 'package:alqgp/Src/Utils/Consts/consts.dart';
import 'package:alqgp/Src/controllers/quiz_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Container scoreArea(
    Size size, QuizController quizController, BuildContext context) {
  return Container(
    width: size.width - (2 * tDefaultPadding),
    decoration: const BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(tCardRadius)),
      color: tCardBgColor,
    ),
    padding: const EdgeInsets.all(tDefaultScreenPadding),
    margin: EdgeInsets.symmetric(
        horizontal: tDefaultScreenPadding, vertical: size.height * 0.12),
    child: Column(
      children: [
        Center(
          child: Text(quizController.ABC(),
              style: Theme.of(context).textTheme.headline5),
        ),
        Container(
          margin: const EdgeInsets.symmetric(
            vertical: tDefaultSpacing,
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset(
                width: size.width / 2.3,
                alignment: Alignment.topRight,
                quizController.photo,
                fit: BoxFit.contain),
          ),
        ),
        Center(
          child: Text(
              "${quizController.updateScore()} / ${quizController.questionNumber()}",
              style: Theme.of(context).textTheme.headline5),
        ),

        Center(
          child: Text(quizController.what2do,
              style: Theme.of(context).textTheme.headline5),
        ),

        // the question card
        Container(
          width: size.width,
          height: size.width * 0.105,
          margin: const EdgeInsets.symmetric(
              vertical: tDefaultSpacing, horizontal: tDefaultPadding),
          child: Row(
            children: [
              Expanded(
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  itemCount: quizController.questions.length,
                  itemBuilder: (context, index) => Container(
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(12)),
                      color: quizController.scores[index] == 1
                          ? Colors.green
                          : Colors.red,
                    ),
                    width: size.width * 0.1,
                    height: size.width * 0.1,
                    child: Center(
                      child: Text("${index + 1}",
                          style: Theme.of(context).textTheme.headline5),
                    ),
                  ),
                  separatorBuilder: (context, index) {
                    return const SizedBox(width: 12);
                  },
                ),
              )
            ],
          ),
        ),

        // next button
        Container(
          padding: const EdgeInsets.only(bottom: tDefaultScreenPadding),
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {
              Get.back();
            },
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(100),
              ),
            ),
            child: Text("Done".toUpperCase()),
          ),
        ),
      ],
    ),
  );
}
