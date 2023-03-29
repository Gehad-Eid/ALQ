import 'package:alqgp/Src/Models/chapter_model.dart';
import 'package:alqgp/Src/Services/database_repo.dart';
import 'package:alqgp/Src/Utils/Consts/consts.dart';
import 'package:alqgp/Src/controllers/home_controller.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

import '../Screens/Authorized/Chapters/chapter.dart';

class ChapterCard extends StatelessWidget {
  Chapter chapter;
  bool home, learning;

  // ******* Function onCardClick +  image size to half

  ChapterCard(
      {required this.chapter,
      // required this.onCardClick,
      this.learning = false,
      this.home = true,
      super.key});

  //******************** theme frindly ?!!!!! */
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(DatabaseRepository());
    final homeController = Get.put(HomeController());

    final size = MediaQuery.of(context).size;
    homeController.setChapterStatusAndProgress(chapter.chapNum!);
    return GestureDetector(
      onTap: () {
        Get.to(() => Chaptercontent(), arguments: chapter);
      },
      child: Container(
          // margin: EdgeInsets.symmetric(vertical: 20),
          height: learning ? tLearningCardHeight : tHomeCardHeight,
          width: size.width / 1.33,
          child: Stack(
            children: [
              //chapter image
              Positioned(
                right: 10,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                      width: size.width / 2.3,
                      alignment: Alignment.topRight,
                      chapter.chapterImage!,
                      fit: BoxFit.contain),
                ),
              ),

              //grandient color cover
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                    height: learning ? tLearningCardHeight : tHomeCardHeight,
                    decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.all(Radius.circular(tCardRadius)),
                        gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              tPrimaryColor.withOpacity(0.7),
                              Colors.transparent
                            ]))),
              ),

              // number of lessons
              Positioned(
                top: 10,
                left: 15,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    children: [
                      Icon(Icons.track_changes, color: Colors.white, size: 25),
                      SizedBox(
                        width: 10,
                      ),
                      Text('${chapter.chapCont}',
                          style: TextStyle(color: Colors.white, fontSize: 20)),
                    ],
                  ),
                ),
              ),

              // step progress indecator
              Positioned(
                top: 50,
                left: 5,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: CircularStepProgressIndicator(
                    selectedColor: tPrimaryColor,
                    totalSteps: chapter.chapCont!,
                    // the progress of the user in this chapter
                    currentStep: homeController.progress.value,
                    width: 100,
                    height: 100,
                    stepSize: 17,
                  ),
                ),
              ),

              // chapter name / status
              learning
                  ? Positioned(
                      bottom: 35,
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Row(
                          children: [
                            const SizedBox(width: 10),
                            //********** set the status from the db */
                            Text(chapter.chapterName!,
                                style: TextStyle(
                                    color: Colors.white, fontSize: 25))
                          ],
                        ),
                      ),
                    )
                  : const SizedBox(),
              Positioned(
                bottom: 0,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    children: [
                      const SizedBox(width: 10),
                      Text(
                        learning
                            ? homeController.status.value
                                // ********* "Status:" ?????!
                                ? "Status: Completed"
                                : "Status: Incomplete"
                            : chapter.chapterName!,
                        style: learning
                            ? TextStyle(color: Colors.white, fontSize: 19)
                            : TextStyle(color: Colors.white, fontSize: 25),
                      ),
                      learning
                          ? homeController.status.value
                              ? Icon(
                                  Icons.check_circle,
                                  color: Colors.green,
                                )
                              : Icon(
                                  Icons.close_rounded,
                                  color: Colors.red,
                                )
                          : SizedBox(),
                    ],
                  ),
                ),
              )
            ],
          )),
    );
  }
}
