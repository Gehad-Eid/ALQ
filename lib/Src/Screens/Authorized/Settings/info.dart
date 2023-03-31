import 'package:alqgp/Src/Screens/Authorized/Settings/Wedgets/changePassword.dart';
import 'package:alqgp/Src/Utils/Consts/consts.dart';
import 'package:alqgp/Src/Utils/Consts/text.dart';
import 'package:alqgp/Src/Widgets/backButton.dart';
import 'package:alqgp/Src/Widgets/copyright.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Widgets/menu_Widget.dart';
import 'Wedgets/AboutUs.dart';
import 'Wedgets/FAQ.dart';

class Info extends StatelessWidget {
  const Info({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Stack(
        children: [
          backButton(),
          //title
          Positioned(
            top: tDefaultSize,
            left: 0,
            right: 0,
            child: Center(
              child: Text("Information",
                  style: Theme.of(context).textTheme.headline5),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(tDefaultScreenPadding),
            margin: const EdgeInsets.only(top: tDefaultSpacing * 2),
            child: Column(children: [
              Text("In this section you can know about ALQ more",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyText1),
              const SizedBox(height: tDefaultSpacing),
              MenuWidget(
                  title: "About Us",
                  icon: Icons.campaign_rounded,
                  onPress: () {
                    Get.to(AboutUs());
                  }),
              MenuWidget(
                  title: "FAQ",
                  icon: Icons.question_answer_outlined,
                  onPress: () {
                    Get.to(FAQ());
                  }),
            ]),
          ),
          copyRight(context),
        ],
      ),
    ));
  }
}
