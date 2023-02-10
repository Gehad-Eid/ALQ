import 'package:flutter/material.dart';

AppBar buildAppBar(BuildContext context, String title) {
  return AppBar(
    automaticallyImplyLeading: false,
    elevation: 0,
    title: Text(
      title,
      style: TextStyle( fontWeight: FontWeight.bold,color: Color(0xFF8EA3E2),),

    ),
    centerTitle: true,
    backgroundColor: Colors.transparent,
  );
}
