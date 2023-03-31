import 'package:alqgp/Src/Utils/Consts/consts.dart';
import 'package:alqgp/Src/Utils/Consts/text.dart';
import 'package:alqgp/Src/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Padding HomePageHeader(HomeController controller) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: tDefaultScreenPadding),

    //************** fix the nullcheck error */
    child: Row(
      children: [
        Text(
          // ************** cheak on it again
          tHomeTitle,
          style: TextStyle(fontSize: 28),
        ),
        Obx(
          () => Text(
            controller.theUser.fullName!.split(" ")[0],
            style: const TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    ),
  );
}
