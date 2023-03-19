import 'package:alqgp/Src/Models/bookmarkFolder_model.dart';
import 'package:alqgp/Src/Services/database_repo.dart';
import 'package:alqgp/Src/Utils/Consts/consts.dart';
import 'package:alqgp/Src/Widgets/findBookmarksFolders.dart';
import 'package:alqgp/Src/controllers/bookmarksFolders_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'widgets/addBookmarkFolder.dart';
import 'widgets/bookmarkFolderCard.dart';

class bookmarksFolders extends StatelessWidget {
  bookmarksFolders({super.key});

  @override
  Widget build(BuildContext context) {
    final bookmarkFolderslist = bookmarkFolder.generateBookmark();
    final controller = Get.put(BookmarksFolderController());
    final databaseRepo = Get.put(DatabaseRepository());
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
          padding:
              const EdgeInsets.symmetric(horizontal: tDefaultScreenPadding),
          child: findBookmarksFolders(null, context, true),
        ),
      ),
    );
  }
}
