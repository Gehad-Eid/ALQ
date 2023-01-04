import 'package:alqgp/screens/lessons/lessonCard.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../models/lesson_model.dart';

class Lessons extends StatefulWidget {
  final int chpNum;
  const Lessons(this.chpNum, {super.key});

//prop
  static const String screenRout = 'lessonsList';

  @override
  State<Lessons> createState() => _LessonsState(chpNum);
}

class _LessonsState extends State<Lessons> {
  List<Object> _lessonsList = [];
  int chapNum = 0;

  _LessonsState(int chpNum) {
    chapNum = chpNum;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    getLessonsList(chapNum);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 156, 203, 247),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Color.fromARGB(255, 156, 203, 247),
        //Color.fromARGB(255, 223, 115, 115)
        elevation: 0,
        title: const Text(
          "Lessons",
          style: TextStyle(
            fontSize: 23,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
          child: ListView.builder(
              itemCount: _lessonsList.length,
              itemBuilder: (context, index) {
                return Lcard(_lessonsList[index] as LessonModle);
              })),
    );
  }

  Future getLessonsList(chpNum) async {
    //final uid = auth(

    var data = await FirebaseFirestore.instance
        .collection('chapters')
        .doc('Chapter $chpNum')
        .collection('Lessons')
        .orderBy('name')
        .get();

    setState(() {
      _lessonsList =
          List.from(data.docs.map((e) => LessonModle.fromSnapshot(e)));
    });
  }
}
