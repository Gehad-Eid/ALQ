import 'package:alqgp/Chapters/chapter.dart';
import 'package:alqgp/Lessons/boookmarks.dart';
import 'package:alqgp/Main/homePage.dart';
import 'package:alqgp/Settings/settings.dart';
import 'package:alqgp/User/profile.dart';
import 'package:alqgp/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class homePage extends StatefulWidget {
  const homePage({super.key});

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  int index = 2;
  final pages = [
    bookMark(),
    chapters(),
    homey(),
    profile(),
    setting(),
  ];

  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();

  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection("student")
        .doc(user!.uid)
        .get()
        .then((value) {
      this.loggedInUser = UserModel.fromMap(value.data());
      //setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    final itList = <Widget>[
      Icon(Icons.bookmark_rounded, size: 30),
      Icon(Icons.auto_stories_rounded, size: 30),
      Icon(Icons.home_rounded, size: 30),
      Icon(Icons.person_rounded, size: 30),
      Icon(Icons.settings_rounded, size: 30),
    ];
    return Scaffold(
      extendBody: true,
      backgroundColor: Color(0xFFF3F7F8),
      // appBar: AppBar(
      //   elevation: 0,
      // ),
      body: pages[index],
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Color.fromARGB(255, 243, 247, 248),
        color: Colors.indigo.shade200,
        animationCurve: Curves.easeInOut,
        animationDuration: Duration(milliseconds: 350),
        height: 60,
        index: index,
        items: itList,
        onTap: (index) => setState(() => this.index = index),
      ),
    );
  }

  // Widget getSelectedWidget({required int index}) {
  //   Widget widget;
  //   switch (index) {
  //     case 0:
  //       widget = const bookMark();
  //       break;
  //     case 1:
  //       widget = const chapters();
  //       break;
  //     case 3:
  //       widget = const profile();
  //       break;
  //     case 4:
  //       widget = const setting();
  //       break;
  //     default:
  //       widget = const setting();
  //       break;
  //   }
  //   return widget;
  // }
}
