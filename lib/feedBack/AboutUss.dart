import 'dart:ui';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import '../models/achive_modle.dart';
import 'package:alqgp/Settings/settings.dart';

class aboutUss extends StatefulWidget {
  static const String screenRout = 'about us';
  const aboutUss( {Key? key}) : super(key: key);
  @override
  _aboutus createState() => _aboutus();
}

class _aboutus extends State<aboutUss> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "About us",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
        elevation: 0,
        centerTitle: true,
        //backgroundColor: Colors.transparent,
        backgroundColor: Color(0xFF8EA3E2),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          //to center
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Column(
              children: [
                const SizedBox(height: 20),
                Container(
                  height: 180,
                  child: Image.asset('images/logo6.png'),
                ),
                // const Text(
                //   'عَــلَــــق ',
                //   style: TextStyle(
                //     fontSize: 40,
                //     fontWeight: FontWeight.w900,
                //     color:Color(0xFF8EA3E2),
                //   ),
                // ),
                const SizedBox(height: 30),
                buildAbout(),
                buildAbout2()
              ],
            ),
            // SizedBox(height: 30),
            // MyButton(
            //   color: Color.fromARGB(255, 223, 115, 115),
            //   title: 'Log in',
            //   onPressed: () {
            //     Navigator.pushNamed(context, LoginScreen.screenRout);
            //   },
            // ),
            // MyButton(
            //   color: Color.fromARGB(255, 156, 203, 247),
            //   title: 'Sign up',
            //   onPressed: () {
            //     Navigator.pushNamed(context, RegistrationScreen.screenRout);
            //     //Navigator.pushNamed(context, sign_up.screenRout);
            //   },
            // )
          ],
        ),
      ),
    );
  }
  
  Widget buildAbout() => Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hello and welcome to ALQ!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold,color: Color.fromARGB(255, 165, 101, 234),),
            ),
            const SizedBox(height: 15,),
            // Text(
            //   "ALQ is reality smartphone app that will teach young learners aged 10-15 years old about human anatomy and organs.\n\nIt was developed by a wonderful team consisting of 5 programmers and a supervisor, affiliated with King Saud University",
            //   style: TextStyle(fontSize: 16, height: 1.4,fontWeight: FontWeight.bold,color:Color(0xFF8EA3E2).withOpacity(0.75),),
            // ),
            // const SizedBox(height: 10,),
            // Text(
            //   "To launch the application, the user must first sign up in order to have an account, then log in. When the user logs in, a welcome page appears, and the user can choose to start learning or go to their profile. If the user starts learning, then human body systems chapters will appear, and the user can choose a chapter and take lessons and see a 3D model, view AR, or take a quiz. If the user goes to their profile, they can see their information, score, and achievements. When the user has finished learning, they can log out.",
            //   style: TextStyle(fontSize: 16, height: 1.4,fontWeight: FontWeight.bold,color:Color(0xFF8EA3E2).withOpacity(0.75),),
            // ),
          ],
        ),
      );

  Widget buildAbout2() => Container(
      padding: const EdgeInsets.all(1),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Color.fromARGB(73, 165, 101, 234),
                  borderRadius: BorderRadius.all(
                    Radius.circular(12.0),
                  ),
                ),
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                child:Column (
                  children: [
                    Text(
                      "ALQ is reality smartphone app that will teach young learners aged 10-15 years old about human anatomy and organs.\n\nIt was developed by a wonderful team consisting of 5 programmers and a supervisor, affiliated with King Saud University.\n",
                      style: TextStyle(fontSize: 16, height: 1.4,fontWeight: FontWeight.bold,color:Colors.white,),
                    ),
                    const SizedBox(height: 5,),
                    Text(
                      "To launch the application, the user must first sign up in order to have an account, then log in.\nWhen the user logs in, a welcome page appears, and the user can choose to start learning or go to their profile.\nIf the user starts learning, then human body systems chapters will appear, and the user can choose a chapter and take lessons and see a 3D model, view AR, or take a quiz.\nIf the user goes to their profile, they can see their information, score, and achievements.\nWhen the user has finished learning, they can log out.",
                      style: TextStyle(fontSize: 16, height: 1.4,fontWeight: FontWeight.bold,color:Colors.white,),
                    ), 
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );

  //   Future<void> abouttUsnev(BuildContext) async {
  //   await FirebaseAuth.instance.signOut();
  //   Navigator.of(context).pushReplacement(
  //       MaterialPageRoute(builder: (context) => setting()));
  // }
}

//Colors.purple.withOpacity(0.22),
//color: Colors.amber,),
//Color.fromARGB(255, 165, 101, 234),