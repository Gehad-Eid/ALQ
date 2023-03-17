import 'package:alqgp/Src/Models/bookmarkFolder_model.dart';
import 'package:alqgp/Src/Services/database_repo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BookmarksFolderController extends GetxController {
  static BookmarksFolderController get instance => Get.find();

  final _databaseRepo = Get.put(DatabaseRepository());

  // final bookmarkFolder bookmarkData = Get.arguments;
}
