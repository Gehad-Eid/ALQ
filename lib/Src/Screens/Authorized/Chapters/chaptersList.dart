import 'package:alqgp/Src/Models/chapter_model.dart';
import 'package:alqgp/Src/Utils/Consts/consts.dart';
import 'package:alqgp/Src/Widgets/chapterCard_widget.dart';
import 'package:flutter/material.dart';

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
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: ChaptersList.length,
                  itemBuilder: ((context, index) => Padding(
                        padding: const EdgeInsets.only(bottom: tDefaultPadding),
                        child: ChapterCard(
                          chapter: ChaptersList[index],
                          home: false,
                          learning: true,
                        ),
                      )),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
