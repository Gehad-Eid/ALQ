import 'package:alqgp/Src/Models/bookmark.dart';
import 'package:alqgp/Src/Screens/Authorized/Bookmarks/bookmarks.dart';
import 'package:alqgp/Src/Utils/Consts/consts.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
                ? AddBookmark()
                : bookmarkFolderCard(bookmarkFolderslist[index])),
      ),
    ));
  }

  Widget AddBookmark() {
    return GestureDetector(
      onTap: () {},
      child: DottedBorder(
        borderType: BorderType.RRect, radius: Radius.circular(20),
        dashPattern: [10, 10],
        color: Colors.grey,
        strokeWidth: 2,
        child: Center(
          child: Text(
            '+ Add',
            style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
          ), // Text
        ), // Center
      ),
    ); // DottedBorder
  }

  Widget bookmarkFolderCard(bookmarkFolder bookmarkFolder) {
    return GestureDetector(
      onTap: () {
        Get.to(() => bookmarks());
      },
      child: Container(
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: bookmarkFolder.bgColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              Icons.monitor_heart_rounded,
              color: bookmarkFolder.iconColor,
              size: 35,
            ), // Icon
            SizedBox(height: tDefaultPadding),
            Text(
              bookmarkFolder.title!,
              style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
            ), // Text
            SizedBox(height: tDefaultPadding),
            Row(
              children: [
                bookmarkCount(bookmarkFolder.iconColor, bookmarkFolder.btnColor,
                    '${bookmarkFolder.count} Bookmark'),
                // can add another btn👍
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget bookmarkCount(Color? bgColor, Color? txColor, String text) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(20)), // BoxDecoration
      child: Text(
        text,
        style: TextStyle(color: txColor),
      ),
    ); // Text ); // Container
  }
}
