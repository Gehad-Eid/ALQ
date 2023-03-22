import 'package:alqgp/Src/Utils/Consts/consts.dart';
import 'package:alqgp/Src/Utils/Consts/text.dart';
import 'package:alqgp/Src/Widgets/chapterCard_widget.dart';
import 'package:alqgp/Src/controllers/chapterList_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChapterProgressList extends StatelessWidget {
  const ChapterProgressList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          tHomeHeading,
          style: Theme.of(context).textTheme.headline5,
        ),
        const SizedBox(height: tDefaultPadding),
        SizedBox(
          height: tHomeCardHeight,
          child: GetX<ChapterListController>(
            init: Get.put<ChapterListController>(ChapterListController()),
            builder: (ChapterListController chapterListController) {
              if (chapterListController != null &&
                  chapterListController.chapters != null) {
                return ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: chapterListController.chapters.length,
                  itemBuilder: ((context, index) => Padding(
                        padding: const EdgeInsets.only(right: tDefaultPadding),
                        child: ChapterCard(
                          chapter: chapterListController.chapters[index],
                          home: true,
                          learning: false,
                        ),
                      )),
                );
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            },
          ),
        ),
      ],
    );
  }
}
