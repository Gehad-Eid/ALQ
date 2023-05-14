import 'package:alqgp/Src/Utils/Consts/consts.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:alqgp/Src/controllers/mainWrapper_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeWrapper extends StatelessWidget {
  HomeWrapper({super.key});

  final MainWrapperController _mainWrapperController =
      Get.put(MainWrapperController());
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: PageView(
          controller: _mainWrapperController.pageController,
          physics: const BouncingScrollPhysics(),
          onPageChanged: _mainWrapperController.updatePage,
          children: [..._mainWrapperController.pages],
        ),

        // nav bar
        bottomNavigationBar: Container(
          margin: EdgeInsets.symmetric(
              horizontal: size.width * 0.03, vertical: tDefaultPadding - 5),
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(tNavBarRadius)),
            child: Obx(
              () => GNav(
                selectedIndex: _mainWrapperController.currentPage.value,
                backgroundColor: tPrimaryColor,
                color: tSecondaryColor,
                activeColor: tSecondaryColor,
                tabBackgroundColor: Colors.grey.shade300, //******** change */
                tabBorderRadius: tNavBarRadius,
                gap: 8,
                padding: const EdgeInsets.all(tNavBarPadding),
                onTabChange: _mainWrapperController.goToTab,
                tabs: const [
                  GButton(
                    icon: Icons.home,
                    text: 'Home',
                  ),
                  GButton(
                    icon: Icons.menu_book_rounded,
                    text: 'Learning',
                  ),
                  GButton(
                    icon: Icons.bookmark,
                    text: 'Bookmarks',
                  ),
                  GButton(
                    icon: Icons.person,
                    text: 'Profile',
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
