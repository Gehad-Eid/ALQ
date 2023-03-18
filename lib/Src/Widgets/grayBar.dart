import 'package:alqgp/Src/Utils/Consts/consts.dart';
import 'package:flutter/material.dart';

Container grayBar(Size size) {
  return Container(
    margin: EdgeInsets.symmetric(
      vertical: tDefaultPadding / 2,
      horizontal: (size.width / 2) - (size.width * 0.15),
    ),
    decoration: const BoxDecoration(
      borderRadius: BorderRadius.all(
        Radius.circular(tCardRadius),
      ),
      color: Colors.grey,
    ),
    width: size.width * 0.15,
    height: 5,
  );
}
