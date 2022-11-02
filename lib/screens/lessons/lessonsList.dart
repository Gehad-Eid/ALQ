import 'package:flutter/material.dart';

class Lessons extends StatefulWidget {
  const Lessons({super.key});

//prop
  static const String screenRout = 'lessonsList';

  @override
  State<Lessons> createState() => _LessonsState();
}

class _LessonsState extends State<Lessons> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lessons"),
      ),
      body: SafeArea(child: Container()),
    );
  }
}
