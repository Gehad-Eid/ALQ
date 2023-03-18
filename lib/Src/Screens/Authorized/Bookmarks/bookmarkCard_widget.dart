import 'package:alqgp/Src/Utils/Consts/consts.dart';
import 'package:alqgp/Src/controllers/bookmark_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

Padding bookmarkCardWithDelete(
    BookmarksController bookmarkController, int index, BuildContext context) {
  return Padding(
    padding: const EdgeInsets.only(bottom: tDefaultPadding),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(20.0),
      child: Slidable(
        endActionPane: ActionPane(motion: StretchMotion(), children: [
          SlidableAction(
            onPressed: ((Context) {
              // ****** delete bookmark
            }),
            icon: Icons.bookmark_remove_rounded,
            backgroundColor: Colors.red,
          ),
        ]),
        child: Container(
          color: tPrimaryColor,
          child: ListTile(
            title: Text(bookmarkController.lessons[index].lessonID,
                style: Theme.of(context)
                    .textTheme
                    .headline5), //*********color:white
            subtitle: Text("${bookmarkController.lessons[index].chapterNum}"),
            leading: Icon(Icons.heart_broken_rounded,
                size: 50), // *******chap photo here
          ),
        ),
      ),
    ),
  );
}
