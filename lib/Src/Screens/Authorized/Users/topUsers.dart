import 'package:alqgp/Src/Utils/Consts/consts.dart';
import 'package:alqgp/Src/Widgets/backButton.dart';
import 'package:alqgp/Src/controllers/home_controller.dart';
import 'package:alqgp/Src/controllers/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AllUsers extends StatelessWidget {
  const AllUsers({super.key});

  @override
  Widget build(BuildContext context) {
    final homeController = Get.put(ProfileController());
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
              child: Text("All Users",
                  style: Theme.of(context).textTheme.headline5),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(tDefaultScreenPadding),
            margin: const EdgeInsets.only(top: tDefaultSpacing * 2),
            child: Column(children: [
              Obx(
                () => homeController.allUsers.length > 0
                    ? Expanded(
                        child: ListView.separated(
                          separatorBuilder: (context, index) {
                            return const SizedBox(height: 12);
                          },
                          physics: const BouncingScrollPhysics(),
                          itemCount: homeController.allUsers.length,
                          itemBuilder: (context, index) {
                            return Container(
                              padding:
                                  const EdgeInsets.all(tDefaultPadding / 3),
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.circular(tCardRadius),
                                color: tPrimaryColor, // ***** change
                              ),
                              height: 100,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  CircleAvatar(
                                      backgroundImage: NetworkImage(
                                          homeController
                                              .allUsers[index].photo!),
                                      radius: 50),
                                  const SizedBox(height: 5),
                                  //break line
                                  Text(homeController.allUsers[index].fullName!,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyLarge),
                                  const SizedBox(height: 5),

                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text("Score",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium),
                                      Text(
                                          "${homeController.allUsers[index].score!}",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium),
                                    ],
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      )
                    : Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            "images/man.png",
                            fit: BoxFit.contain,
                          ),
                          SizedBox(
                            height: tDefaultPadding,
                          ),
                          Center(
                            child: Text("No achievements",
                                style: Theme.of(context).textTheme.headline3),
                          ),
                        ],
                      ),
              ),
            ]),
          ),
        ],
      ),
    ));
  }
}
