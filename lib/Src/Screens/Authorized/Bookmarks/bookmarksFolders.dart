import 'package:alqgp/Src/Models/bookmarkFolder_model.dart';
import 'package:alqgp/Src/Utils/Consts/consts.dart';
import 'package:flutter/material.dart';

import 'widgets/addBookmarkFolder.dart';
import 'widgets/bookmarkFolderCard.dart';

class bookmarksFolders extends StatelessWidget {
  bookmarksFolders({super.key});

  final bookmarkFolderslist = bookmarkFolder.generateBookmark();
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
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: tDefaultScreenPadding),
          child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: bookmarkFolderslist.length,
              itemBuilder: (context, index) => bookmarkFolderslist[index].isLast
                  ? addBookmarkFolder()
                  : bookmarkFolderCard(bookmarkFolderslist[index])),
        ),
      ),
    );
  }
}
