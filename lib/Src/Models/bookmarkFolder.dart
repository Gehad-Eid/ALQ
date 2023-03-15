import 'package:alqgp/Src/Utils/Consts/consts.dart';
import 'package:flutter/material.dart';

class bookmarkFolder {
  String? title, id;
  Color? bgColor, iconColor, btnColor;
  int? count;
  // num? done;
  bool isLast;

  bookmarkFolder({
    this.id,
    this.bgColor,
    this.iconColor,
    this.title,
    this.btnColor,
    // this.done,
    this.count,
    this.isLast = false,
  });

  static List<bookmarkFolder> generateBookmark() {
    return [
      bookmarkFolder(
        title: 'important',
        bgColor: kYellowLight,
        iconColor: kYellow,
        btnColor: kYellowDark,
        count: 3,
        // done: 1,
      ),
      bookmarkFolder(
        title: 'Personal',
        bgColor: kBlueLight,
        iconColor: kBlue,
        btnColor: kBlueDark,
        count: 3,
        // done: 1,
      ),
      bookmarkFolder(
        title: 'somthing',
        bgColor: kRedLight,
        iconColor: kRed,
        btnColor: kRedDark,
        count: 3,
        // done: 1,
      ),
      bookmarkFolder(isLast: true),
    ];
  }
}
