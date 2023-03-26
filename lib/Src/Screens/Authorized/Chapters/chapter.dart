import 'package:alqgp/Src/Screens/Authorized/Quiz/quiz.dart';
import 'package:alqgp/Src/Utils/Consts/consts.dart';
import 'package:alqgp/Src/Utils/Consts/text.dart';
import 'package:alqgp/Src/controllers/chapter_controller.dart';
import 'package:alqgp/Src/Screens/Authorized/Chapters/widgets/chapterHeader_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'widgets/chapterLessonCard.dart';

class Chaptercontent extends StatelessWidget {
  const Chaptercontent({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ChapterController());
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        //*******scan and back

        body: SingleChildScrollView(
          child: GetX<ChapterController>(
            init: Get.put<ChapterController>(ChapterController()),
            builder: (ChapterController chapterController) {
              if (chapterController.lessons.isNotEmpty) {
                return Column(
                  children: [
                    //******** fullscreen in 3D
                    lessonCardWithIndicatorAndModel(
                        size, chapterController.lessons, controller),
                    const SizedBox(height: tDefaultPadding),
                    const Divider(),

                    //header and boxes of organes
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: tDefaultScreenPadding),
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(tChapterHeading1,
                                style: Theme.of(context).textTheme.headline5),
                          ),
                          lessonCardList(chapterController.lessons,
                              controller.chapterContent.chapNum!),
                        ],
                      ),
                    ),

                    //quiz button
                    Container(
                      padding: const EdgeInsets.only(
                        left: tDefaultScreenPadding,
                        right: tDefaultScreenPadding,
                        // bottom: tDefaultScreenPadding
                      ),
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          Get.to(() => quiz(),
                              arguments:
                                  chapterController.chapterContent.chapNum);
                        },
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100),
                          ),
                        ),
                        child: Text(tQuiz.toUpperCase()),
                      ),
                    ),
                  ],
                );
              } else {
                //while loading data
                return Container(
                    margin: EdgeInsets.only(top: size.height / 2),
                    child: const Center(child: CircularProgressIndicator()));
              }
            },
          ),
        ),
      ),
    );
  }
}
