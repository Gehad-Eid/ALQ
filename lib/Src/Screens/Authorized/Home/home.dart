import 'package:alqgp/Src/Screens/Authorized/Home/homeHeader.dart';
import 'package:alqgp/Src/Utils/Consts/consts.dart';
import 'package:flutter/material.dart';

import 'Widgets/chapterProgressList.dart';
import 'Widgets/progressChart.dart';
import 'Widgets/userAvatarAndName.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding:
                const EdgeInsets.symmetric(horizontal: tDefaultScreenPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HomePageHeader(),
                SizedBox(height: tDefaultPadding),
                ChapterProgressList(),
                SizedBox(height: tDefaultSpacing),
                PeerRankWithAvatarAndName(),
                SizedBox(height: tDefaultSpacing),
                ProgressChart()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
