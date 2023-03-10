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
        Container(
          height: tHomeCardHeight,
          child: ListView(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            children: [
              ChapterCard(),
              const SizedBox(width: tDefaultPadding),
              ChapterCard(),
            ],
          ),
        ),

        // ListView.builder(
        //   scrollDirection: Axis.horizontal,
        //   itemCount: 5,
        //   itemBuilder: (BuildContext ctx, int index) {
        //     return ChapterCard();
        //   },
        // ),

        // ListView.builder(
        //   scrollDirection: Axis.horizontal,
        //   itemBuilder: itemBuilder,
        //   controller: ,
        //   itemCount: ,
        //   ),
      ],
    );
  }
}
