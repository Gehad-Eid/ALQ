import 'package:flutter/material.dart';

AppBar buildAppBar(BuildContext context, String title) {
  return AppBar(
    automaticallyImplyLeading: false,
    elevation: 0,
    title: Text(
      title,
    ),
    centerTitle: true,
    backgroundColor: Colors.transparent,
  );
}
