import 'package:alqgp/Src/Utils/Consts/consts.dart';
import 'package:flutter/material.dart';

Positioned copyRight(BuildContext context) {
  Size size = MediaQuery.of(context).size;
  return Positioned(
    bottom: tDefaultScreenPadding,
    left: size.width * 0.39,
    child: Row(children: const [
      Icon(Icons.copyright),
      Text(" ALAQ 2023"),
    ]),
  );
}
