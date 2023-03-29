import 'package:flutter/material.dart';

Widget bookmarkCount(
    Color? bgColor, Color? txColor, String text, BuildContext context) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
    decoration:
        BoxDecoration(color: bgColor, borderRadius: BorderRadius.circular(20)),
    child: Text(text, style: Theme.of(context).textTheme.bodyMedium),
  );
}
