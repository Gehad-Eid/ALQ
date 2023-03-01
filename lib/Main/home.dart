import 'package:alqgp/Chapters/chapter.dart';
import 'package:alqgp/Lessons/boookmarks.dart';
import 'package:alqgp/Main/homePage.dart';
import 'package:alqgp/Services/auth_services.dart';
import 'package:alqgp/Settings/settings.dart';
import 'package:alqgp/Ptofile/profile.dart';
import 'package:alqgp/models/user_model.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

class homePage extends StatefulWidget {
  const homePage({super.key});

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  int index = 2;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<UserModel?>(
      future: getUser(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final loggedInUser = snapshot.data;
          final pages = [
            bookMark(loggedInUser: loggedInUser!),
            chapters(loggedInUser: loggedInUser),
            homey(loggedInUser),
            profile(user: loggedInUser),
            // const setting(),
          ];

          final itList = <Widget>[
            const Icon(Icons.bookmark_rounded, size: 30),
            const Icon(Icons.auto_stories_rounded, size: 30),
            const Icon(Icons.home_rounded, size: 30),
            const Icon(Icons.person_rounded, size: 30),
            const Icon(Icons.settings_rounded, size: 30),
          ];

          return Scaffold(
            extendBody: true,
            body: pages[index],
            bottomNavigationBar: CurvedNavigationBar(
              backgroundColor: Colors.transparent,
              color: Colors.indigo.shade200,
              animationCurve: Curves.easeInOut,
              animationDuration: const Duration(milliseconds: 350),
              height: 60,
              index: index,
              items: itList,
              onTap: (index) => setState(() => this.index = index),
            ),
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
