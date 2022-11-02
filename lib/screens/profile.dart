import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
//import 'package:photo_sharing_clone_app/home_screen/home_screen.dart';
//import 'package:screens/screens.dart';
import 'package:alqgp/navBar.dart';

class ProfileScreen extends StatefulWidget {
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String? firstName = '';
  String? lastName = '';
  String? name = '';
  String? email = '';
  String? image = '';
  int score = 0;
  File? imageFile;

  Future _getDataFromDatabase() async {
    await FirebaseFirestore.instance
        .collection("student")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get()
        .then((snapshot) async {
      if (snapshot.exists) {
        setState(() {
          firstName = snapshot.data()!["FIRST_NAME"];
          lastName = snapshot.data()!["LAST_NAME"];
          name = snapshot.data()!["FIRST_NAME"] +
              ' ' +
              snapshot.data()!["LAST_NAME"];
          email = snapshot.data()!["EMAIL"];
          image = snapshot.data()!["IMAGE"];
          score = snapshot.data()!["Score"];
        });
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getDataFromDatabase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
            colors: [Color(0xFF40BAD5), Color(0xFFfcca46)],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            stops: const [0.2, 0.9],
          )),
        ),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 245, 243, 237),
        title: const Center(
          child: Text(
            'Profile',
            style: TextStyle(
              fontSize: 35,
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontFamily: "Signatra",
            ),
          ),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (_) => NavBar()));
          },
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFfcca46), Color(0xFF023047)],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            stops: const [0.2, 0.9],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                // shoe image
              },
              child: CircleAvatar(
                backgroundColor: Colors.white,
                minRadius: 60.0,
                child: CircleAvatar(
                  radius: 55.0,
                  backgroundImage: imageFile == null
                      ? NetworkImage(image!)
                      : Image.file(imageFile!).image,
                ),
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Name: ' + name!,
                  //'Last name: ' + lastName!,
                  style: const TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    //display text input
                  },
                  icon: Icon(Icons.edit),
                ),
              ],
            ),
            const SizedBox(
              height: 10.0,
            ),
            Text(
              'Your email: ' + email!,
              style: const TextStyle(
                fontSize: 20.0,
                color: Colors.black,
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Text(
              "Your score= " + score.toString(),
              style: const TextStyle(
                fontSize: 20.0,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
