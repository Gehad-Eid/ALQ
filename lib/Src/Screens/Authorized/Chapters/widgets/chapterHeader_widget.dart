import 'package:alqgp/Src/Models/lesson_model.dart';
import 'package:alqgp/Src/Utils/Consts/consts.dart';
import 'package:alqgp/Src/Widgets/the3Dmodel.dart';
import 'package:alqgp/Src/controllers/chapter_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

SizedBox lessonCardWithIndicatorAndModel(
    Size size, List<lesson> chapterData, ChapterController controller) {
  return SizedBox(
    height: size.height * 0.60,
    child: Stack(
      children: [
        modelWidget(
            size.height * 0.33, chapterData[0].nameAndModle!.split(",")[1]),

        //lessonCard
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          height: size.height * 0.33,
          child: Column(
            children: [
              // chapter name
              // Container(
              //   margin: const EdgeInsets.only(
              //     left: tDefaultSize,
              //     right: tDefaultSize,
              //     top: tDefaultSize,
              //   ),
              //   decoration: const BoxDecoration(
              //     color: tPrimaryColor,
              //     borderRadius: BorderRadius.only(
              //         topRight: Radius.circular(tCardRadius * 1.5),
              //         topLeft: Radius.circular(tCardRadius * 1.5)),
              //   ),
              //   child:
              // ),

              // lesson content with TTS icon
              Expanded(
                child: PageView.builder(
                    controller: controller.pageController,
                    onPageChanged: (value) =>
                        controller.onPageChangedCallback(value),
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: chapterData[0].parts!.length,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: const EdgeInsets.only(
                            left: tDefaultSize,
                            right: tDefaultSize,
                            top: tDefaultSize,
                            bottom: tDefaultPadding),
                        decoration: const BoxDecoration(
                          color: tPrimaryColor,
                          borderRadius: BorderRadius.all(
                              Radius.circular(tCardRadius * 1.5)),
                        ),
                        child: Column(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(tDefaultPadding),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Center(
                                    child: Text(
                                      controller.chapterContent.chapterName!,
                                      style:
                                          Theme.of(context).textTheme.headline5,
                                    ),
                                  ),
                                  Icon(Icons.volume_up),
                                ],
                              ),
                            ),
                            //******* add TTS
                            Text(
                              //****** start from left */
                              chapterData[0].parts![index],
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                          ],
                        ),
                      );
                    }),
              ),
            ],
          ),
        ),

        // indecator
        Obx(
          () => Align(
            alignment: Alignment.bottomCenter,
            child: AnimatedSmoothIndicator(
              count: chapterData[0].parts!.length,
              activeIndex: controller.currentPage.value,
              effect: const ExpandingDotsEffect(
                activeDotColor: tPrimaryColor,
                dotHeight: 5.0,
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
