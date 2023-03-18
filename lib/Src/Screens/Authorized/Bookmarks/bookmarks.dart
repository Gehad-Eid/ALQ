import 'package:alqgp/Src/Models/bookmark_model.dart';
import 'package:alqgp/Src/Utils/Consts/consts.dart';
import 'package:alqgp/Src/controllers/bookmark_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';

import 'bookmarkCard_widget.dart';

class bookmarks extends StatelessWidget {
  const bookmarks({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(BookmarksController());
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          //************** change appBar themeData */
          //********** add delete folder */
          title: Text(
            'Bookmarks',
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: tDefaultScreenPadding, vertical: tDefaultPadding),
          child: GetX<BookmarksController>(
            init: Get.put<BookmarksController>(BookmarksController()),
            builder: (BookmarksController bookmarkController) {
              if (bookmarkController.lessons.isNotEmpty) {
                return ListView.builder(
                  itemCount: bookmarkController.lessons.length,
                  itemBuilder: (_, index) => bookmarkCardWithDelete(
                      bookmarkController, index, context),
                );
              } else {
                return Center(
                  child: Text("Ther's No Bookmarks!",
                      style: Theme.of(context)
                          .textTheme
                          .headline2), //***** add null photo */
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
