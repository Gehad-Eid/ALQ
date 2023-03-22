import 'package:alqgp/Src/Utils/Consts/consts.dart';
import 'package:alqgp/Src/Widgets/findBookmarksFolders.dart';
import 'package:alqgp/Src/Widgets/grayBar.dart';
import 'package:alqgp/Src/controllers/lesson_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

DraggableScrollableSheet lessonArea(Size size, LessonController controller) {
  return DraggableScrollableSheet(
    maxChildSize: 0.7,
    minChildSize: 0.13,
    initialChildSize: 0.13,
    builder: (context, scrollController) {
      return Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(tCardRadius),
          ),
          color: Colors.white,
        ),
        child: Padding(
          padding:
              const EdgeInsets.symmetric(horizontal: tDefaultScreenPadding),
          child: ListView(
            physics: const BouncingScrollPhysics(),
            controller: scrollController,
            children: [
              // the stick gray bar
              grayBar(size),

              // the name and bookmark icon
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: size.height * 0.13 - 5 - tDefaultPadding,
                    child: Center(
                      child: Obx(
                        () => Text(
                            controller
                                .lessonsList[controller.currentLessonIndex]
                                .nameAndModle
                                .split(",")[0],
                            style: Theme.of(context).textTheme.headline3),
                      ),
                    ),
                  ),
                  Obx(
                    () => GestureDetector(
                      onTap: () {
                        // *********** add to/from bookmark
                        controller.lessonsList[controller.currentLessonIndex]
                                .bookmarked!
                            ? Get.bottomSheet(
                                backgroundColor: Colors.white,
                                shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(tCardRadius),
                                        topRight:
                                            Radius.circular(tCardRadius))),
                                findBookmarksFolders(
                                    controller, context, false),
                              )
                            : print("yaaaaaay");
                      },
                      child: Icon(
                        Icons.bookmark,
                        color: controller
                                .lessonsList[controller.currentLessonIndex]
                                .bookmarked!
                            ? Colors.blue
                            : Colors.amber,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: tDefaultSpacing),

              //Lesson card and indecator
              Obx(
                () => AspectRatio(
                  aspectRatio: 15 / 11,
                  child: PageView.builder(
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    onPageChanged: (value) {
                      controller.onPageChangedCallback(value);
                      controller.showNextButton();
                      controller.stoptTTS();
                    },
                    itemCount: controller
                        .lessonsList[controller.currentLessonIndex]
                        .parts!
                        .length,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: tDefaultPadding / 2),
                        height: tDefaultSpacing,
                        decoration: BoxDecoration(
                          color: tPrimaryColor,
                          borderRadius:
                              BorderRadius.circular(tCardRadius * 1.5),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(tDefaultPadding),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // lesson's part title and TTS icon
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Obx(
                                    () => Text(
                                        controller
                                            .lessonsList[
                                                controller.currentLessonIndex]
                                            .parts![index]
                                            .split("+")[0],
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline4),
                                  ),
                                  Obx(
                                    () => GestureDetector(
                                      onTap: () {
                                        controller.tts.value
                                            ? controller.startTTS(controller
                                                .lessonsList[controller
                                                    .currentLessonIndex]
                                                .parts![index]
                                                .replaceAll("+", "\n"))
                                            : controller.pauseTTS();
                                      },
                                      child: Icon(
                                        color: controller.tts.value
                                            ? Colors.amber
                                            : Colors.red,
                                        controller.tts.value
                                            ? Icons.volume_up
                                            : Icons.pause_circle,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: tDefaultPadding),

                              // lesson's part content
                              AspectRatio(
                                aspectRatio: 10 / 5,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: ClipRRect(
                                        borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(tCardRadius),
                                          topRight:
                                              Radius.circular(tCardRadius),
                                        ),
                                        child: SingleChildScrollView(
                                          physics:
                                              const BouncingScrollPhysics(),
                                          child: Obx(
                                            () => Text(
                                                controller
                                                    .lessonsList[controller
                                                        .currentLessonIndex]
                                                    .parts![index]
                                                    .split("+")[1]
                                                    .replaceAll("\\n", "\n"),
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .headline5),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              const SizedBox(height: tDefaultPadding),

              // indicator
              Obx(
                () => Align(
                  alignment: Alignment.bottomCenter,
                  child: AnimatedSmoothIndicator(
                    count: controller.lessonsList[controller.currentLessonIndex]
                        .parts!.length,
                    activeIndex: controller.currentPage.value,
                    effect: const ExpandingDotsEffect(
                      activeDotColor: tPrimaryColor,
                      dotHeight: 5.0,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: tDefaultSpacing),

              // Next button
              Obx(
                () => Visibility(
                  visible: controller.next.value ||
                      controller.lessonsList[controller.currentLessonIndex]
                              .parts!.length ==
                          1,
                  child: ElevatedButton(
                    onPressed: () {
                      controller.nextLesson();
                    },
                    child: Text(controller.currentLessonIndex + 1 >=
                            controller.lessonsList.length
                        ? 'Finished!'
                        : 'Next organ ...'),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}
