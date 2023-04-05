import 'package:alqgp/Src/Utils/Consts/consts.dart';
import 'package:alqgp/Src/Widgets/backButton.dart';
import 'package:alqgp/Src/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Achievements extends StatelessWidget {
  const Achievements({super.key});

  @override
  Widget build(BuildContext context) {
    final homeController = Get.put(HomeController());
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
              child: Text("Achievements",
                  style: Theme.of(context).textTheme.headline5),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(tDefaultScreenPadding),
            margin: const EdgeInsets.only(top: tDefaultSpacing * 2),
            child: Column(children: [
              Obx(
                () => Expanded(
                  child: ListView.separated(
                    separatorBuilder: (context, index) {
                      return const SizedBox(height: 12);
                    },
                    physics: const BouncingScrollPhysics(),
                    itemCount: homeController.achievements.length,
                    itemBuilder: (context, index) {
                      return Container(
                        padding: const EdgeInsets.all(tDefaultPadding / 3),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(tCardRadius),
                          color: tPrimaryColor, // ***** change
                        ),
                        height: 100,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image(
                                image: AssetImage(
                                    homeController.achievements[index].photo!),
                                height: 100),
                            const SizedBox(height: 5),
                            //break line
                            Text(homeController.achievements[index].title!,
                                style: Theme.of(context).textTheme.bodyLarge),
                            const SizedBox(height: 5),
                            Text(
                                "${homeController.achievements[index].score!}/10",
                                style: Theme.of(context).textTheme.bodyLarge),
                            const SizedBox(height: 5),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                    homeController
                                        .achievements[index].chapterName!
                                        .split(" ")[0],
                                    style:
                                        Theme.of(context).textTheme.bodyMedium),
                                Text(
                                    homeController
                                        .achievements[index].chapterName!
                                        .split(" ")[1],
                                    style:
                                        Theme.of(context).textTheme.bodyMedium),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
            ]),
          ),
        ],
      ),
    ));
  }
}
