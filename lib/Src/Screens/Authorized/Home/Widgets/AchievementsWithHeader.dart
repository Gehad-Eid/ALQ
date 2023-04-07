import 'package:alqgp/Src/Screens/Authorized/Users/achievements.dart';
import 'package:alqgp/Src/Utils/Consts/consts.dart';
import 'package:alqgp/Src/Utils/Consts/text.dart';
import 'package:alqgp/Src/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AchievementsWithHeader extends StatelessWidget {
  const AchievementsWithHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final homeController = Get.put(HomeController());
    Size size = MediaQuery.of(context).size;
    return Container(
      height: 250,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(tHomeHeading3, style: Theme.of(context).textTheme.headline5),
              TextButton(
                  onPressed: () => {Get.to(() => Achievements())},
                  child: Text(tSeeAll,
                      style: Theme.of(context).textTheme.headline5))
            ],
          ),
          const SizedBox(height: tDefaultPadding),
          // Expanded(
          //   child: GetX<HomeController>(
          //     init: Get.put<HomeController>(HomeController()),
          //     builder: (HomeController controller) {
          //       if (controller != null && controller.achievements != null) {
          //         return Expanded(
          //           child: ListView.separated(
          //             separatorBuilder: (context, index) {
          //               return const SizedBox(width: 12);
          //             },
          //             physics: const BouncingScrollPhysics(),
          //             scrollDirection: Axis.horizontal,
          //             itemCount: 5,
          //             itemBuilder: (context, index) {
          //               return Container(
          //                 padding: const EdgeInsets.all(tDefaultPadding / 3),
          //                 decoration: BoxDecoration(
          //                   borderRadius: BorderRadius.circular(tCardRadius),
          //                   color: Colors.grey.shade200, // ***** change
          //                 ),
          //                 height: 100,
          //                 child: Column(
          //                   children: [
          //                     Image(
          //                         image: AssetImage(
          //                             controller.achievements[index].photo!),
          //                         height: 100),
          //                     const SizedBox(height: 5),
          //                     //break line
          //                     Text(controller.achievements[index].title!,
          //                         style: Theme.of(context).textTheme.bodyLarge),
          //                     const SizedBox(height: 5),
          //                     Text(
          //                         "${controller.achievements[index].score!}/10",
          //                         style: Theme.of(context).textTheme.bodyLarge),
          //                     const SizedBox(height: 5),
          //                     Text(
          //                         controller.achievements[index].chapterName!
          //                                 .split(" ")[0] +
          //                             " ...",
          //                         style:
          //                             Theme.of(context).textTheme.bodyMedium),
          //                     // Text("system",
          //                     //     style: Theme.of(context).textTheme.bodyMedium),
          //                   ],
          //                 ),
          //               );
          //             },
          //           ),
          //         );
          //       } else {
          //         return const Center(child: CircularProgressIndicator());
          //       }
          //     },
          //   ),
          // ),

          Obx(
            () => homeController.achievements.length > 0
                ? Expanded(
                    child: ListView.separated(
                      separatorBuilder: (context, index) {
                        return const SizedBox(width: 12);
                      },
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemCount: homeController.achievements.length,
                      itemBuilder: (context, index) {
                        return Container(
                          padding: const EdgeInsets.all(tDefaultPadding / 3),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(tCardRadius),
                            color: Colors.grey.shade200, // ***** change
                          ),
                          height: 100,
                          child: Column(
                            children: [
                              Image(
                                  image: AssetImage(homeController
                                      .achievements[index].photo!),
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
                              Text(
                                  homeController
                                          .achievements[index].chapterName!
                                          .split(" ")[0] +
                                      " ...",
                                  style:
                                      Theme.of(context).textTheme.bodyMedium),
                              // Text("system",
                              //     style: Theme.of(context).textTheme.bodyMedium),
                            ],
                          ),
                        );
                      },
                    ),
                  )
                : Center(
                    child: Text("No achievements",
                        style: Theme.of(context).textTheme.headline3),
                  ),
          ),
        ],
      ),
    );
  }
}
