import 'package:alqgp/Src/Utils/Consts/consts.dart';
import 'package:alqgp/Src/Utils/Consts/text.dart';
import 'package:alqgp/Src/Widgets/grayBar.dart';
import 'package:alqgp/Src/controllers/bookmarksFolders_controller.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget addBookmarkFolder(BookmarksFolderController controller, context) {
  Size size = MediaQuery.of(context).size;
  return GestureDetector(
    onTap: () {
      addFolderBottomSheet(size, context, controller);
    },
    child: DottedBorder(
      borderType: BorderType.RRect,
      radius: const Radius.circular(tCardRadius),
      dashPattern: const [10, 10],
      color: Colors.grey,
      strokeWidth: 2,
      child: const Center(
        child: Text(
          '+ Add',
          style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
        ),
      ),
    ),
  );
}

Future<dynamic> addFolderBottomSheet(
    Size size, context, BookmarksFolderController controller) {
  return Get.bottomSheet(
    enableDrag: true,
    backgroundColor: Colors.white,
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(tCardRadius),
            topRight: Radius.circular(tCardRadius))),
    Column(
      children: [
        // gray bar
        grayBar(size),
        const SizedBox(height: tDefaultSize),

        Expanded(
          child: ListView(
            children: [
              //title
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: tDefaultPadding),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(tAddBookmarkTitle,
                      style: Theme.of(context).textTheme.headline4),
                ),
              ),
              const SizedBox(height: tDefaultSize),

              // title text feild
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: tDefaultPadding),
                child: TextFormField(
                  controller: controller.FolderTitle,
                  decoration: const InputDecoration(
                      label: Text(tAddBookmark),
                      prefixIcon: Icon(Icons.bookmark_add)),
                ),
              ),
              const SizedBox(height: tDefaultPadding),

              //list of colors
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: tDefaultPadding),
                height: 80,
                child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      final itemColor = controller.predefinedColors[index];
                      return Obx(
                        () => GestureDetector(
                          onTap: () {
                            controller.getColor(index);
                          },
                          child: Material(
                            color: itemColor,
                            elevation: 4,
                            shape: CircleBorder(
                              side: index == controller.choosenColor.value
                                  ? const BorderSide(width: 1.5)
                                  : BorderSide.none,
                            ),
                            child: Container(
                              width: 50,
                              height: 50,
                            ),
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return const SizedBox(width: 12);
                    },
                    itemCount: controller.predefinedColors.length),
              ),
              const SizedBox(height: tDefaultSpacing),

              // Add button
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: tDefaultPadding),
                child: ElevatedButton(
                  onPressed: () {
                    if (controller.FolderTitle.text != "") {
                      controller.addFolder(controller.FolderTitle.text);
                      controller.FolderTitle.clear();
                      // show snackbar that it was success
                      Get.snackbar("Success",
                          "The bookmark has been added successfully.",
                          snackPosition: SnackPosition.BOTTOM,
                          backgroundColor: Colors.white.withOpacity(0.5),
                          colorText: Colors.green);
                      Get.close(1);
                    } else {
                      Get.snackbar("error", "Please enter a name",
                          snackPosition: SnackPosition.BOTTOM,
                          backgroundColor: Colors.red.withOpacity(0.3),
                          colorText: Colors.red);
                      // Get.close(1);
                    }
                  },
                  child: const Center(child: Text("Add")),
                ),
              )
            ],
          ),
        ),
      ],
    ),
  );
}
