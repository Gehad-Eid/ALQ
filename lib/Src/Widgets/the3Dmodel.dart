import 'package:easy_web_view2/easy_web_view2.dart';
import 'package:flutter/material.dart';

Container modelWidget(size, srcData) {
  return Container(
    height: size,
    child: EasyWebView(
      src: srcData,
      onLoaded: () {}, // Try to convert to flutter widgets
    ),
  );
}
