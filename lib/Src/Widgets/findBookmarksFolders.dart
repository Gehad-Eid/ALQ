import 'package:alqgp/Src/Screens/Authorized/Bookmarks/widgets/addBookmarkFolder.dart';
import 'package:alqgp/Src/Screens/Authorized/Bookmarks/widgets/bookmarkCount.dart';
import 'package:alqgp/Src/Screens/Authorized/Bookmarks/widgets/bookmarkFolderCard.dart';
import 'package:alqgp/Src/Utils/Consts/consts.dart';
import 'package:alqgp/Src/controllers/bookmarksFolders_controller.dart';
import 'package:alqgp/Src/controllers/lesson_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'grayBar.dart';

GetX<BookmarksFolderController> findBookmarksFolders(
    LessonController? controller, BuildContext context, bool fromBookmarks) {
  Size size = MediaQuery.of(context).size;
  return GetX<BookmarksFolderController>(
    init: Get.put<BookmarksFolderController>(BookmarksFolderController()),
    builder: (BookmarksFolderController folderController) {
      if (folderController != null && folderController.folders != null) {
        // check if it's a bookmarks list for bookmarks screen or for add bookmark in lessons secreen
        return fromBookmarks
            ? bookmarksScreenFolders(folderController, context)
            : lessonScreenbookmarksFolders(
                size, controller, context, folderController);
      } else {
        return const Center(child: CircularProgressIndicator());
      }
    },
  );
}

Column lessonScreenbookmarksFolders(Size size, LessonController? controller,
    BuildContext context, BookmarksFolderController folderController) {
  return Column(
    children: [
      // the stick gray bar
      grayBar(size),
      const SizedBox(height: tDefaultPadding),

      // **** needs an obs var to function "${controller!.next.value}"
      Text("Choose a folder", style: Theme.of(context).textTheme.headline5),

      const SizedBox(height: tDefaultPadding),

      // List of bookmarks
      Expanded(
        child: ListView.builder(
          itemCount: folderController.folders.length,
          itemBuilder: (_, index) {
            return folderController.folders[index].isLast
                // ******* add a new folder icon
                ? const SizedBox(
                    height:
                        tDefaultPadding) //addBookmarkFolder(folderController, context)
                : Container(
                    decoration: BoxDecoration(
                      color: folderController.folders[index].bgColor,
                      borderRadius: BorderRadius.circular(tCardRadius),
                    ),
                    margin: const EdgeInsets.symmetric(
                      horizontal: tDefaultScreenPadding,
                      vertical: tDefaultPadding / 3,
                    ),
                    child: ListTile(
                      // ** icon from model
                      leading: Icon(Icons.monitor_heart_rounded),
                      title: Text(
                        folderController.folders[index].title!,
                        style: Theme.of(context).textTheme.headline5,
                      ),
                      iconColor: folderController.folders[index].iconColor,
                      trailing: bookmarkCount(
                        folderController.folders[index].iconColor,
                        folderController.folders[index].btnColor,
                        // ***** add an icon inestade of "Bookmarks"
                        '${folderController.folders[index].count} Bookmark',
                      ),
                      onTap: () {
                        controller!.addBookmarkWithFolderID(
                          folderController.folders[index].id!,
                        );
                      },
                    ),
                  );
          },
        ),
      ),
    ],
  );
}

GridView bookmarksScreenFolders(
    BookmarksFolderController folderController, BuildContext context) {
  return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemCount: folderController.folders.length,
      itemBuilder: (_, index) {
        return folderController.folders[index].isLast
            ? addBookmarkFolder(folderController, context)
            : bookmarkFolderCard(folderController.folders[index]);
      });
}
