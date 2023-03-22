import 'package:alqgp/Src/Models/lesson_model.dart';
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
        //scan and back

        body: SingleChildScrollView(
          // child: Container(
          // padding: const EdgeInsets.all(tDefaultSize),
          child: GetX<ChapterController>(
            init: Get.put<ChapterController>(ChapterController()),
            builder: (ChapterController chapterController) {
              if (chapterController.lessons.isNotEmpty) {
                // if (snapshot.hasData) {
                // List<lesson> chapterData = snapshot.data as List<lesson>;

                return Column(
                  children: [
                    //******** fullscreen in 3D
                    lessonCardWithIndicatorAndModel(
                        size, chapterController.lessons, controller),
                    const SizedBox(height: tDefaultPadding),
                    const Divider(),
                    // const SizedBox(height: tDefaultPadding),

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
                          //****** go to quiz
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
                // } else if (snapshot.hasError) {
                //   return Center(child: Text(snapshot.error.toString()));
                // } else {
                //   return const Center(child: Text('Somthing went wrong.'));
                // }
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

// ****** delete that shit woman
  Container listofChap(List<lesson> chapterData) {
    return Container(
      child: ListView.builder(
          shrinkWrap: true,
          // physics: const BouncingScrollPhysics(),
          //     scrollDirection: Axis.horizontal,
          itemCount: 3,
          itemBuilder: (context, index) {
            return Column(
              children: [
                SizedBox(
                  child: Text("Name: ${chapterData[1].parts![index]}"),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(chapterData[index].id!),
                    // ListView.builder(
                    //   itemCount: chapterData[index].parts!.length,
                    //   itemBuilder: (context, i) {
                    //     Text(chapterData[index].parts![i]);
                    //   },
                    // )
                  ],
                ),
                const SizedBox(
                  height: 10,
                )
              ],
            );
          }),
    );
  }
}
