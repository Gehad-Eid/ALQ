import 'package:alqgp/Src/Screens/Home/home.dart';
import 'package:alqgp/Src/Utils/Consts/consts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class bottomNavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //************ fix colors + theme */
    final isDarkMode =
        MediaQuery.of(context).platformBrightness == Brightness.dark;
    print(isDarkMode);
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(12.0)),
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20),
      child: GNav(
        backgroundColor: isDarkMode ? tSecondaryColor : tPrimaryColor,
        color: isDarkMode ? tPrimaryColor : tSecondaryColor,
        activeColor: isDarkMode ? tPrimaryColor : tSecondaryColor,
        tabBackgroundColor: Colors.grey.shade300,
        gap: 8,
        padding: EdgeInsets.all(16),
        // onTabChange: (value) => ,
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
    );
  }
}
