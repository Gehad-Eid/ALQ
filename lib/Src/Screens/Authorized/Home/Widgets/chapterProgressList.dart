import 'package:alqgp/Src/Models/chapter_model.dart';
import 'package:alqgp/Src/Utils/Consts/consts.dart';
import 'package:alqgp/Src/Utils/Consts/text.dart';
import 'package:alqgp/Src/Widgets/chapterCard_widget.dart';
import 'package:flutter/material.dart';

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
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: ChaptersList.length,
            itemBuilder: ((context, index) => Padding(
                  padding: const EdgeInsets.only(right: tDefaultPadding),
                  child: ChapterCard(
                    chapter: ChaptersList[index],
                    home: true,
                    learning: false,
                  ),
                )),
          ),
        ),
      ],
    );
  }
}
