import 'package:flutter/material.dart';
//import 'package:alqgp/navBar.dart';
import 'package:alqgp/screens/body.dart';


class header extends StatefulWidget {
  const header({super.key});

  @override
  State<header> createState() => HomeScreen();
  
}

class HomeScreen extends State<header> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Body(),
    );
  }
  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      /*
      logo
      leading: IconButton(
        iconSize: 100,
        icon: Image.asset("images/logo.jpeg"),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const header()),
          );
        },
      ),
      */
      title: Center(
      child: Text(
        "ALQ",
        style: TextStyle(
        fontSize: 23,
        color: Colors.black,
          ),
        ),
      ),
      actions: [
      IconButton(
        icon: Image.asset('images/profile2.png'),
        onPressed: () => null,//go to profile page 
      ),
    ],
    );
  }
}

//padding: EdgeInsets.only(left:90, bottom: 70, right: 50, top:70),

/*
title: const Text(
        "ALQ",
        style: TextStyle(
          fontSize: 23,
          color: Colors.black,
        ),
      ),
Image.asset(
          "images/profile2.PNG",
        ),
import 'package:flutter/material.dart';
import 'package:alqgp/navBar.dart';

class header extends StatefulWidget {
  const header({super.key});

  @override
  State<header> createState() => _headerState();
}

class _headerState extends State<header> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavBar(),
      appBar: AppBar(
        title: Text(
          "ALQ",
          //start the changes
          style: TextStyle(
            fontSize: 23,
          ),
        ),
        elevation: 0.0,
        backgroundColor: Theme.of(context).accentColor,
        centerTitle: true,
      ),
      body: Container(
        child: Container(
          height: 800,
          width: double. infinity,
          decoration: BoxDecoration(
            color: Colors .white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
          ),
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 30,top: 30),
                child: Text(
                  "Select chapter",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black87,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              
            ],
          ),
        ),
      ),
    );
  }
}


*/