import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

Widget addBookmarkFolder() {
  return GestureDetector(
    onTap: () {
      //add book mark folder
    },
    child: DottedBorder(
      borderType: BorderType.RRect, radius: Radius.circular(20),
      dashPattern: [10, 10],
      color: Colors.grey,
      strokeWidth: 2,
      child: Center(
        child: Text(
          '+ Add',
          style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
        ), // Text
      ), // Center
    ),
  ); // DottedBorder
}
