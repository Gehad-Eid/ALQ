import 'package:alqgp/Src/Models/chapter_model.dart';
import 'package:alqgp/Src/Utils/Consts/consts.dart';
import 'package:flutter/material.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class ChapterCard extends StatelessWidget {
  // Chapter? chapter;
  bool home, learning;

  Function? onCardClick;

  ChapterCard({
    // this.chapter,
    this.onCardClick,
    this.learning = false,
    this.home = true,
  });

//******************** theme frindly ?!!!!! */
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        this.onCardClick!();
      },
      child: Container(
          // margin: EdgeInsets.symmetric(vertical: 20),
          height: learning ? tLearningCardHeight : tHomeCardHeight,
          width: size.width / 1.33,
          child: Stack(
            children: [
              //chapter image
              Positioned.fill(
                right: 10,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                      alignment: Alignment.topRight,
                      // 'assets/imgs/' + this.chapter!.imgName! + '.png',
                      'images/urinary.png',
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
                      Text('5',
                          style: TextStyle(color: Colors.white, fontSize: 20)),
                    ],
                  ),
                ),
              ),

              // step progress indecator
              Positioned(
                top: 50,
                left: 20,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: CircularStepProgressIndicator(
                    selectedColor: tPrimaryColor,
                    totalSteps: 10,
                    currentStep: 6,
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
                            // CategoryIcon(
                            //     color: this.chapter!.color,
                            //     iconName: this.chapter!.icon),
                            const SizedBox(width: 10),
                            Text('this.chapter!.name!',
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
                      // CategoryIcon(
                      //     color: this.chapter!.color,
                      //     iconName: this.chapter!.icon),
                      const SizedBox(width: 10),
                      Text(learning ? 'this status' : 'this.chapter!.name!',
                          style: TextStyle(color: Colors.white, fontSize: 25))
                    ],
                  ),
                ),
              )
            ],
          )),
    );
  }
}
