import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:alqgp/navBar.dart';

import '../models/user_model.dart';
import 'edit_profile.dart';

class ProfileScreen extends StatefulWidget {
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
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

  /* String? name = '';
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
            colors: [
              Color.fromARGB(255, 245, 153, 156),
              Color.fromARGB(255, 159, 233, 247)
            ],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            stops: const [0.2, 0.9],
          )),
        ),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 229, 214, 168),
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
            colors: [
              Color.fromARGB(255, 222, 156, 77),
              Color.fromARGB(255, 136, 208, 239)
            ],
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
                // show image
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
                  style: const TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                /*IconButton(
                  onPressed: () {
                    //display text input
                  },
                  icon: Icon(Icons.edit),
                ),*/ // to edit
              ],
            ),
            const SizedBox(
              height: 10.0,
            ),
            Text(
              'Email: ' + email!,
              style: const TextStyle(
                fontSize: 20.0,
                color: Colors.black,
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Text(
              "Score= " + score.toString(),
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
*/
  /* editProfile({required String currentUserId}) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                editProfile(currentUserId: '${loggedInUser.uid}')));
  }*/

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Stack(
      fit: StackFit.expand,
      children: [
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 219, 106, 98),
                Color.fromARGB(255, 156, 203, 247),
                //Color.fromARGB(255, 219, 106, 98), //Color.fromARGB(255, 235, 87, 87)
                //Color.fromARGB(255, 85, 98, 199),
              ],
              begin: FractionalOffset.bottomCenter,
              end: FractionalOffset.topCenter,
            ),
          ),
        ),
        Scaffold(
          //extendBodyBehindAppBar: true,
          appBar: AppBar(
            title: Text('Profile'),
            centerTitle: true,
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 73),
              child: Column(
                children: [
                  /* Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      ),
                      Icon(
                        Icons.logout,
                        color: Colors.white,
                      ),
                    ],
                  ),*/
                  /*SizedBox(
                    height: 20,
                  ),
                  Text(
                    'My Profile',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 34,
                      fontFamily: 'Nisebuschgardens',
                    ),
                  ),*/
                  // SizedBox(
                  //   height: 22,
                  // ),
                  Container(
                    height: height * 0.5,
                    child: LayoutBuilder(
                      builder: (context, constraints) {
                        double innerHeight = constraints.maxHeight;
                        double innerWidth = constraints.maxWidth;
                        return Stack(
                          fit: StackFit.expand,
                          children: [
                            Positioned(
                              bottom: 0,
                              left: 0,
                              right: 0,
                              child: Container(
                                height: innerHeight * 0.79,
                                width: innerWidth,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color: Colors.white,
                                ),
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: innerHeight * 0.35,
                                    ),
                                    Text(
                                      '${loggedInUser.firstName} ${loggedInUser.secondName}',
                                      style: TextStyle(
                                        color: Color.fromRGBO(39, 105, 171, 1),
                                        //fontFamily: 'Nunito',
                                        fontSize: 37,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Column(
                                          children: [
                                            Text(
                                              'Score',
                                              style: TextStyle(
                                                color: Colors.grey[700],
                                                //fontFamily: 'Nunito',
                                                fontSize: 25,
                                              ),
                                            ),
                                            Text(
                                              '${loggedInUser.score}',
                                              style: TextStyle(
                                                color: Color.fromRGBO(
                                                    39, 105, 171, 1),
                                                //fontFamily: 'Nunito',
                                                fontSize: 25,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 25,
                                            vertical: 8,
                                          ),
                                          child: Container(
                                            height: 50,
                                            width: 3,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(100),
                                              color: Colors.grey,
                                            ),
                                          ),
                                        ),
                                        Column(
                                          children: [
                                            Text(
                                              'level',
                                              style: TextStyle(
                                                color: Colors.grey[700],
                                                //fontFamily: 'Nunito',
                                                fontSize: 25,
                                              ),
                                            ),
                                            Text(
                                              '${loggedInUser.level}',
                                              style: TextStyle(
                                                color: Color.fromRGBO(
                                                    39, 105, 171, 1),
                                                //fontFamily: 'Nunito',
                                                fontSize: 25,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                            /*Positioned(
                              top: 110,
                              right: 20,
                              child: Icon(
                                Icons.settings,
                                color: Colors.grey[700],
                                size: 30,
                              ),
                            ),*/
                            Positioned(
                              top: 0,
                              left: 0,
                              right: 0,
                              child: Center(
                                child: Container(
                                  child: Image.asset(
                                    'images/5b8f3d9f30460aeedbe6a235e2d001d3.jpg',
                                    width: innerWidth * 0.45,
                                    fit: BoxFit.fitWidth,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Container(
                    // height: height * 0.5,
                    width: width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            'Scoreboard',
                            style: TextStyle(
                              color: Color.fromRGBO(39, 105, 171, 1),
                              fontSize: 27,
                              //fontFamily: 'Nunito',
                            ),
                          ),
                          Divider(
                            thickness: 2.5,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(
                                        'images/1_l__xN8qEkukiGk26cbKiCw.png'),
                                    fit: BoxFit.cover)),
                            height: 200, //height * 0.15,
                            // decoration: BoxDecoration(
                            //   color: Colors.grey,
                            //   borderRadius: BorderRadius.circular(30),
                            // ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          // Container(
                          //   height: 40, //height * 0.15,
                          //   decoration: BoxDecoration(
                          //     color: Colors.grey,
                          //     borderRadius: BorderRadius.circular(30),
                          //   ),
                          // ),
                          SizedBox(
                            //the bottom padding
                            height: 20,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    // height: height * 0.5,
                    width: width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            'My Achievements',
                            style: TextStyle(
                              color: Color.fromRGBO(39, 105, 171, 1),
                              fontSize: 27,
                              //fontFamily: 'Nunito',
                            ),
                          ),
                          Divider(
                            thickness: 2.5,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            height: 40, //height * 0.15,
                            decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            height: 40, //height * 0.15,
                            decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          SizedBox(
                            //the bottom padding
                            height: 20,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}


//https://www.youtube.com/watch?v=4izADcEsH8Y