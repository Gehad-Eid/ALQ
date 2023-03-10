import 'package:alqgp/Src/Screens/Authorized/Home/Widgets/chapterProgressList.dart';
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
            'Learning',
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: tDefaultScreenPadding, vertical: tDefaultPadding),
          child: ListView(
            physics: const BouncingScrollPhysics(),
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: tDefaultPadding),
                child: ChapterCard(learning: true, home: false),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: tDefaultPadding),
                child: ChapterCard(learning: true, home: false),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: tDefaultPadding),
                child: ChapterCard(learning: true, home: false),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: tDefaultSpacing),
                child: ChapterCard(learning: true, home: false),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: tDefaultSpacing),
                child: ChapterCard(learning: true, home: false),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
