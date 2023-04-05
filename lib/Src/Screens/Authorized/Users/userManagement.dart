import 'package:alqgp/Src/Models/user_model.dart';
import 'package:alqgp/Src/Utils/Consts/consts.dart';
import 'package:alqgp/Src/Widgets/backButton.dart';
import 'package:alqgp/Src/Widgets/copyright.dart';
import 'package:alqgp/Src/Widgets/menu_Widget.dart';
import 'package:alqgp/Src/controllers/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'achievements.dart';
import 'topUsers.dart';

class UserManagement extends StatelessWidget {
  const UserManagement({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProfileController());
    Size size = MediaQuery.of(context).size;
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
              child: Text("User Management",
                  style: Theme.of(context).textTheme.headline5),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(tDefaultScreenPadding),
            margin: const EdgeInsets.only(top: tDefaultSpacing * 2),
            child: Column(children: [
              FutureBuilder(
                  future: controller.getUserData(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      if (snapshot.hasData) {
                        UserModel userData = snapshot.data as UserModel;
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CircleAvatar(
                              backgroundImage: AssetImage(userData.photo!),
                              radius: size.width * 0.15,
                            ),
                            const Divider(),
                            Column(
                              children: [
                                Text(userData.fullName!,
                                    textAlign: TextAlign.center,
                                    style:
                                        Theme.of(context).textTheme.headline5),
                                const Divider(),
                                Text(userData.email!,
                                    textAlign: TextAlign.center,
                                    style:
                                        Theme.of(context).textTheme.bodyText2),
                                const Divider(),
                                Text(userData.phoneNo!,
                                    textAlign: TextAlign.center,
                                    style:
                                        Theme.of(context).textTheme.bodyText2),
                                Divider(),
                              ],
                            ),
                            const Divider(),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Score",
                                    textAlign: TextAlign.center,
                                    style:
                                        Theme.of(context).textTheme.headline5),
                                const Divider(),
                                Text("${userData.score!}",
                                    textAlign: TextAlign.center,
                                    style:
                                        Theme.of(context).textTheme.headline5),
                              ],
                            )
                          ],
                        );
                      } else if (snapshot.hasError) {
                        return Center(child: Text(snapshot.error.toString()));
                      } else {
                        return const Center(
                            child: Text('Somthing went wrong.'));
                      }
                    } else {
                      return const Center(child: CircularProgressIndicator());
                    }
                  }),
              const SizedBox(height: tDefaultSpacing),
              MenuWidget(
                  title: "Your Achievements",
                  icon: Icons.star_sharp,
                  onPress: () {
                    Get.to(Achievements());
                  }),
              MenuWidget(
                  title: "All users",
                  icon: Icons.supervisor_account,
                  onPress: () {
                    Get.to(AllUsers());
                  }),
            ]),
          ),
          copyRight(context),
        ],
      ),
    ));
  }
}
