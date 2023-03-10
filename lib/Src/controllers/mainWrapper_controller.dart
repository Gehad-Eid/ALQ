import 'package:alqgp/Src/Screens/Authorized/Bookmarks/bookmarksFolders.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:alqgp/Src/Screens/Authorized/Chapters/chaptersList.dart';
import 'package:alqgp/Src/Screens/Authorized/Home/home.dart';
import 'package:alqgp/Src/Screens/Authorized/Users/Profile/profile.dart';

class MainWrapperController extends GetxController {
  PageController pageController = PageController(initialPage: 0);

  RxInt currentPage = 0.obs;

  List<Widget> pages = [
    Home(),
    chapterList(),
    bookmarksFolders(),
    profile(),
  ];

  void goToTab(int page) {
    currentPage.value = page;
    pageController.jumpToPage(page);
  }

  void updatePage(int page) {
    currentPage.value = page;
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
}
