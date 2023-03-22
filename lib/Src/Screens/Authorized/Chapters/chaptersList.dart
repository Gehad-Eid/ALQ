import 'package:alqgp/Src/Models/chapter_model.dart';
import 'package:alqgp/Src/Utils/Consts/consts.dart';
import 'package:alqgp/Src/Widgets/chapterCard_widget.dart';
import 'package:alqgp/Src/controllers/chapterList_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class chapterList extends StatelessWidget {
  const chapterList({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          //************** change appBar themeData */
          title: Text(
            'Learning', // in text & usable
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: tDefaultScreenPadding,
                    vertical: tDefaultPadding),
                child: GetX<ChapterListController>(
                  init: Get.put<ChapterListController>(ChapterListController()),
                  builder: (ChapterListController chapterListController) {
                    if (chapterListController != null &&
                        chapterListController.chapters != null) {
                      return ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        itemCount: chapterListController.chapters.length,
                        itemBuilder: ((context, index) => Padding(
                              padding: const EdgeInsets.only(
                                  bottom: tDefaultPadding),
                              child: ChapterCard(
                                chapter: chapterListController.chapters[index],
                                home: false,
                                learning: true,
                              ),
                            )),
                      );
                    } else {
                      return const Center(child: CircularProgressIndicator());
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
