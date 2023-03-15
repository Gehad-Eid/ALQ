import 'package:alqgp/Src/Utils/Consts/consts.dart';
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
              Container(
                margin: EdgeInsets.symmetric(
                  vertical: tDefaultPadding / 2,
                  horizontal: (size.width / 2) - (size.width * 0.15),
                ),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(tCardRadius),
                  ),
                  color: Colors.grey,
                ),
                width: size.width * 0.15,
                height: 5,
              ),

              // the name and bookmark icon
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: size.height * 0.13 - 5 - tDefaultPadding,
                    child: Center(
                      child: Text(
                          controller.lessonContent.nameAndModle!.split(",")[0],
                          style: Theme.of(context).textTheme.headline2),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      // *********** add to/from bookmark
                    },
                    child: Icon(
                      Icons.bookmark,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: tDefaultSpacing),

              //Lesson card dand indecator
              AspectRatio(
                aspectRatio: 15 / 11,
                child: PageView.builder(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  onPageChanged: (value) {
                    controller.onPageChangedCallback(value);
                    controller.showNextButton();
                  },
                  itemCount: controller.lessonContent.parts!.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: tDefaultPadding / 2),
                      height: tDefaultSpacing,
                      decoration: BoxDecoration(
                        color: tPrimaryColor,
                        borderRadius: BorderRadius.circular(tCardRadius * 1.5),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(tDefaultPadding),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                    controller.lessonContent.parts![index]
                                        .split("+")[0],
                                    style:
                                        Theme.of(context).textTheme.headline4),
                                GestureDetector(
                                  onTap: () {
                                    // *********** add TTS
                                  },
                                  child: Icon(
                                    Icons.volume_up,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: tDefaultPadding),
                            AspectRatio(
                              aspectRatio: 10 / 5,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(tCardRadius),
                                        topRight: Radius.circular(tCardRadius),
                                      ),
                                      child: SingleChildScrollView(
                                        physics: const BouncingScrollPhysics(),
                                        child: Text(
                                            controller
                                                .lessonContent.parts![index]
                                                .split("+")[1],
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline4),
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
              const SizedBox(height: tDefaultPadding),
              Obx(
                () => Align(
                  alignment: Alignment.bottomCenter,
                  child: AnimatedSmoothIndicator(
                    count: controller.lessonContent.parts!.length,
                    activeIndex: controller.currentPage.value,
                    effect: const ExpandingDotsEffect(
                      activeDotColor: tPrimaryColor,
                      dotHeight: 5.0,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: tDefaultSpacing),
              Obx(
                () => Visibility(
                  visible: controller.next.value,
                  child: ElevatedButton(
                    onPressed: () {
                      // *********** add to next lesson / end of chapter
                    },
                    child: Text(controller.currentPage >=
                            controller.lessonContent.parts!
                                .length //controller.next.value
                        ? 'Finish!'
                        : 'Next Organ'),
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
