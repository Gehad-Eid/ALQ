import 'package:alqgp/Src/Models/lesson_model.dart';
import 'package:easy_web_view2/easy_web_view2.dart';
import 'package:flutter/material.dart';

Container modelWidget(Size size, List<lesson> chapterData) {
  return Container(
    height: size.height * 0.33,
    child: EasyWebView(
      src: chapterData[0].nameAndModle!.split(",")[1],
      onLoaded: () {}, // Try to convert to flutter widgets
    ),
  );
}
