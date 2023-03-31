import 'package:alqgp/Src/Screens/Authorized/Settings/Wedgets/changePassword.dart';
import 'package:alqgp/Src/Utils/Consts/consts.dart';
import 'package:alqgp/Src/Utils/Consts/text.dart';
import 'package:alqgp/Src/Widgets/backButton.dart';
import 'package:alqgp/Src/Widgets/copyright.dart';
import 'package:alqgp/Src/Widgets/menu_Widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'Wedgets/reportAbug.dart';
import 'Wedgets/sendFeedback.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

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
              child: Text("Settings",
                  style: Theme.of(context).textTheme.headline5),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(tDefaultScreenPadding),
            margin: const EdgeInsets.only(top: tDefaultSpacing * 2),
            child: Column(children: [
              // ** hajar
              Text("In this section you can feel free",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyText1),
              const SizedBox(height: tDefaultSpacing),
              MenuWidget(
                  title: tChangePassword,
                  icon: Icons.password,
                  onPress: () {
                    Get.to(ChangePassword());
                  }),
              MenuWidget(
                  title: "Report A Bug",
                  icon: Icons.bug_report,
                  onPress: () {
                    Get.to(ReportABug());
                  }),
              MenuWidget(
                  title: "Send Feedback",
                  icon: Icons.thumbs_up_down,
                  onPress: () {
                    Get.to(SendFeedback());
                  }),
            ]),
          ),
          copyRight(context),
        ],
      ),
    ));
  }
}
