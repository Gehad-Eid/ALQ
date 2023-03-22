import 'package:alqgp/Src/Utils/Consts/consts.dart';
import 'package:alqgp/Src/Widgets/findBookmarksFolders.dart';
import 'package:flutter/material.dart';

class bookmarksFolders extends StatelessWidget {
  const bookmarksFolders({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          //************** change appBar themeData */
          title: const Text(
            'Bookmarks',
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        body: Container(
          padding:
              const EdgeInsets.symmetric(horizontal: tDefaultScreenPadding),
          child: findBookmarksFolders(null, context, true),
        ),
      ),
    );
  }
}
