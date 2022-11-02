import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:alqgp/navBar.dart';

import '../models/user_model.dart';

class header extends StatefulWidget {
  //prop
  static const String screenRout = 'chapters';

  const header({super.key});

  @override
  State<header> createState() => _headerState();
}

class _headerState extends State<header> {
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
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavBar(),
      appBar: AppBar(
        title: Text("ALQ"),
      ),
    );
  }
}
