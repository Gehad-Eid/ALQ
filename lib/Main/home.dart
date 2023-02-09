import 'package:alqgp/Chapters/chapter.dart';
import 'package:alqgp/Lessons/boookmarks.dart';
import 'package:alqgp/Main/homePage.dart';
import 'package:alqgp/Settings/settings.dart';
import 'package:alqgp/Ptofile/profile.dart';
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
  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();

  @override
  void initState() {
    FirebaseFirestore.instance
        .collection("student")
        .doc(user!.uid)
        .get()
        .then((value) {
      loggedInUser = UserModel.fromMap(value.data());
      //setState(() {});
    });
    super.initState();
  }

  int index = 2;

  @override
  Widget build(BuildContext context) {
    final pages = [
      bookMark(),
      chapters(
        loggedInUser: loggedInUser as UserModel,
      ),
      homey(loggedInUser.firstName),
      profile(user: loggedInUser),
      const setting(),
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
  }
}
