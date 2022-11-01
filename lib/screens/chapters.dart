import 'package:flutter/material.dart';
import 'package:alqgp/navBar.dart';

class header extends StatefulWidget {
  //prop
  static const String screenRout = 'chapters';

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
        title: Text("ALQ"),
      ),
    );
  }
}
