import 'package:alqgp/Src/Models/chapter_model.dart';
import 'package:alqgp/Src/Services/database_repo.dart';
import 'package:alqgp/Src/Utils/Consts/consts.dart';
import 'package:alqgp/Src/controllers/bookmark_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';

Padding bookmarkCardWithDelete(
    BookmarksController bookmarkController, int index, BuildContext context) {
  final _databaseRepo = Get.put(DatabaseRepository());
  return Padding(
    padding: const EdgeInsets.only(bottom: tDefaultPadding),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(20.0),
      child: Slidable(
        endActionPane: ActionPane(motion: StretchMotion(), children: [
          SlidableAction(
            onPressed: ((Context) {
              // ****** delete bookmark
              _databaseRepo.deleteBookmark(
                  bookmarkController.bookmarkfolder.id!,
                  bookmarkController.lessons[index].id!);
            }),
            icon: Icons.bookmark_remove_rounded,
            backgroundColor: Colors.red,
          ),
        ]),
        child: Container(
          color: bookmarkController.bookmarkfolder.bgColor,
          child: ListTile(
            // Lesson name
            title: Text(bookmarkController.lessons[index].name,
                style: Theme.of(context)
                    .textTheme
                    .headline5), //*********color:white

            // chapter name
            subtitle: Text(
                "${ChaptersList[bookmarkController.lessons[index].chapterNum - 1].chapterName}"),

            // ******** get the icon forom the folder // *******chap photo here
            leading: Icon(Icons.heart_broken_rounded, size: 50),
          ),
        ),
      ),
    ),
  );
}
