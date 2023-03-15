import 'package:alqgp/Src/Models/bookmarkFolder.dart';
import 'package:alqgp/Src/Utils/Consts/consts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../bookmarks.dart';
import 'bookmarkCount.dart';

Widget bookmarkFolderCard(bookmarkFolder bookmarkFolder) {
  return GestureDetector(
    onTap: () {
      Get.to(() => bookmarks());
    },
    child: Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: bookmarkFolder.bgColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            Icons.monitor_heart_rounded,
            color: bookmarkFolder.iconColor,
            size: 35,
          ), // Icon
          SizedBox(height: tDefaultPadding),
          Text(
            bookmarkFolder.title!,
            style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
          ), // Text
          SizedBox(height: tDefaultPadding),
          Row(
            children: [
              bookmarkCount(bookmarkFolder.iconColor, bookmarkFolder.btnColor,
                  '${bookmarkFolder.count} Bookmark'),
              // can add another btn👍
            ],
          ),
        ],
      ),
    ),
  );
}
