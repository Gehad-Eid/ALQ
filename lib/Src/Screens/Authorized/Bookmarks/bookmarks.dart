import 'package:alqgp/Src/Utils/Consts/consts.dart';
import 'package:flutter/material.dart';

import 'bookmarkCard_widget.dart';

class bookmarks extends StatelessWidget {
  const bookmarks({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          //************** change appBar themeData */
          title: Text(
            'Bookmarks',
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: tDefaultScreenPadding, vertical: tDefaultPadding),
          child: ListView(
            physics: const BouncingScrollPhysics(),
            children: [
              BookmarkCardWithDelete(),
              BookmarkCardWithDelete(),
              BookmarkCardWithDelete(),
              BookmarkCardWithDelete(),
              BookmarkCardWithDelete(),
              BookmarkCardWithDelete(),
              BookmarkCardWithDelete(),
              BookmarkCardWithDelete(),
              BookmarkCardWithDelete(),
              BookmarkCardWithDelete(),
            ],
          ),
        ),
      ),
    );
  }
}
