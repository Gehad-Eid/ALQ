import 'package:flutter/material.dart';

Widget bookmarkCount(Color? bgColor, Color? txColor, String text) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
    decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(20)), // BoxDecoration
    child: Text(
      text,
      style: TextStyle(color: txColor),
    ),
  ); // Text ); // Container
}
