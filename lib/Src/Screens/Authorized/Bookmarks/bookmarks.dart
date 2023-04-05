import 'package:alqgp/Src/Models/bookmark_model.dart';
import 'package:alqgp/Src/Utils/Consts/consts.dart';
import 'package:alqgp/Src/Utils/Consts/text.dart';
import 'package:alqgp/Src/Widgets/backButton.dart';
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
        body: Stack(
          children: [
            //title
            Positioned(
              top: tDefaultSize,
              left: 0,
              right: 0,
              child: Center(
                child: Text(controller.bookmarkfolder.title!,
                    style: Theme.of(context).textTheme.headline4),
              ),
            ),
            //back bttuon
            backButton(),
            // delete button
            Positioned(
              right: tDefaultPadding,
              top: tDefaultSize,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(tCardRadius),
                  color: Colors.redAccent.withOpacity(0.1),
                ),
                height: 50,
                width: 50,
                child: IconButton(
                    onPressed: () {
                      controller.deleteFolder();
                    },
                    icon: const Icon(
                      Icons.folder_delete_rounded,
                      color: Colors.red,
                      size: 30,
                    )),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(tDefaultScreenPadding),
              margin: const EdgeInsets.only(top: tDefaultSpacing * 2),
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
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          "images/man.png",
                          fit: BoxFit.contain,
                        ),
                        SizedBox(
                          height: tDefaultPadding,
                        ),
                        Center(
                          child: Text("No Bookmarks!",
                              style: Theme.of(context).textTheme.headline3),
                        ),
                      ],
                    );
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
