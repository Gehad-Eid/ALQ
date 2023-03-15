import 'package:alqgp/Src/Models/bookmarkFolder.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BookmarksFolderController extends GetxController {
  static BookmarksFolderController get instance => Get.find();

  final bookmarkFolder bookmarkData = Get.arguments;
}
