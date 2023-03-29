import 'package:alqgp/Src/Screens/Authorized/Home/achievements.dart';
import 'package:alqgp/Src/Utils/Consts/consts.dart';
import 'package:alqgp/Src/Utils/Consts/text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProgressChart extends StatelessWidget {
  const ProgressChart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
                  onPressed: () => {Get.to(() => achievements())},
                  child: Text(tSeeAll,
                      style: Theme.of(context).textTheme.headline5))
            ],
          ),
          const SizedBox(height: tDefaultPadding),
          //************** chart here */
          Expanded(
            child: ListView.separated(
              separatorBuilder: (context, index) {
                return const SizedBox(width: 12);
              },
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: 5,
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
                      Image(image: AssetImage("images/star.png"), height: 100),
                      const SizedBox(height: 5),
                      //break line
                      Text("perfect",
                          style: Theme.of(context).textTheme.bodyLarge),
                      const SizedBox(height: 5),
                      Text("4/10",
                          style: Theme.of(context).textTheme.bodyLarge),
                      const SizedBox(height: 5),
                      Text("Circulatory system".split(" ")[0] + " ...",
                          style: Theme.of(context).textTheme.bodyMedium),
                      // Text("system",
                      //     style: Theme.of(context).textTheme.bodyMedium),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
