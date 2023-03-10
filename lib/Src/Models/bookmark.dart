import 'package:alqgp/Src/Utils/Consts/consts.dart';
import 'package:flutter/material.dart';

class bookmarkFolder {
  String? title;
  Color? bgColor;
  Color? iconColor;
  Color? btnColor;
  num? count;
  num? done;
  bool isLast;

  bookmarkFolder({
    this.bgColor,
    this.iconColor,
    this.title,
    this.btnColor,
    this.done,
    this.count,
    this.isLast = false,
  });

  static List<bookmarkFolder> generateBookmark() {
    return [
      bookmarkFolder(
        title: 'Personal',
        bgColor: tPrimaryColor,
        iconColor: tAccentColor,
        btnColor: tCardBgColor,
        count: 3,
        done: 1,
      ),
      bookmarkFolder(
        title: 'Personal',
        bgColor: tPrimaryColor,
        iconColor: tAccentColor,
        btnColor: tCardBgColor,
        count: 3,
        done: 1,
      ),
      bookmarkFolder(
        title: 'Personal',
        bgColor: tPrimaryColor,
        iconColor: tAccentColor,
        btnColor: tCardBgColor,
        count: 3,
        done: 1,
      ),
      bookmarkFolder(isLast: true),
    ];
  }
}
