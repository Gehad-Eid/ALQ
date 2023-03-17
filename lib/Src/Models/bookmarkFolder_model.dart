import 'package:alqgp/Src/Utils/Consts/consts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
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

  // Map user fetched from Firebase to UserModel
  factory bookmarkFolder.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;

    return bookmarkFolder(
      id: document.id,
      title: data["title"],
      bgColor: data["bgColor"],
      btnColor: data["btnColor"],
      iconColor: data["iconColor"],
    );
  }

  // Map user data from UserModel to a map (json form)
  toJson() {
    return {
      "title": title,
      "bgColor": bgColor,
      "btnColor": btnColor,
      "iconColor": iconColor,
    };
  }

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
