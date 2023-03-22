import 'package:alqgp/Src/Models/bookmark_model.dart';
import 'package:alqgp/Src/Utils/Consts/consts.dart';
import 'package:alqgp/Src/Utils/Consts/text.dart';
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
            controller.bookmarkfolder.title!,
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          actions: [
            ElevatedButton(
              onPressed: () {
                controller.deleteFolder();
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.redAccent.withOpacity(0.1),
                  elevation: 0,
                  foregroundColor: Colors.red,
                  shape: const StadiumBorder(),
                  side: BorderSide.none),
              child: const Text(tDelete),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: tDefaultScreenPadding, vertical: tDefaultPadding),
          child: GetX<BookmarksController>(
            init: Get.put<BookmarksController>(BookmarksController()),
            builder: (BookmarksController bookmarkController) {
              if (!controller.NotExsit.value) {
                if (bookmarkController.lessons.isNotEmpty) {
                  return ListView.builder(
                    itemCount: bookmarkController.lessons.length,
                    itemBuilder: (_, index) => bookmarkCardWithDelete(
                        bookmarkController, index, context),
                  );
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              } else if (controller.NotExsit.value &&
                  !bookmarkController.lessons.isNotEmpty) {
                return Center(
                  child: Text("No Bookmarks!",
                      style: Theme.of(context)
                          .textTheme
                          .headline3), //***** add null photo */
                );
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            },
          ),
        ),
      ),
    );
  }
}
