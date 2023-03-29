import 'package:alqgp/Src/Utils/Consts/consts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Positioned backButton() {
  return Positioned(
    left: tDefaultPadding,
    top: tDefaultSize,
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(tCardRadius),
        color: Colors.grey.shade300.withOpacity(0.33),
      ),
      height: 50,
      width: 50,
      child: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(Icons.arrow_back_ios_new)),
    ),
  );
}
