import 'package:alqgp/Src/Models/lesson_model.dart';
import 'package:alqgp/Src/Screens/Authorized/Lessons/lesson.dart';
import 'package:alqgp/Src/Utils/Consts/consts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

SizedBox lessonCardList(List<lesson> chapterData) {
  return SizedBox(
    height: tChapterLessonsBoxHeight,
    child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: chapterData.length,
        itemBuilder: (context, index) {
          return index > 0
              ? Container(
                  width: tChapterLessonsCardWidth,
                  margin: const EdgeInsets.symmetric(
                      horizontal: tDefaultPadding / 2,
                      vertical: tDefaultPadding),
                  child: GestureDetector(
                    onTap: () =>
                        Get.to(() => Lesson(), arguments: chapterData[index]),
                    child: Column(
                      children: [
                        Container(
                          height: tChapterLessonsCardHeight,
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(tCardRadius), //100 ***
                            border: Border.all(),
                            image: DecorationImage(
                              image: AssetImage("images/backgraund3.png"),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        //break line in name
                        Text(chapterData[index].nameAndModle!.split(",")[0],
                            style: Theme.of(context).textTheme.bodyLarge),
                      ],
                    ),
                  ))
              : const SizedBox();
        }),
  );
}
