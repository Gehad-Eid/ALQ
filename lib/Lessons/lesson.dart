import 'package:alqgp/Lessons/lessonContent.dart';
import 'package:alqgp/consts.dart';
import 'package:alqgp/models/lesson_model.dart';
import 'package:alqgp/screens/lessons/lesson_content.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class lessons extends StatefulWidget {
  final int chpNum;
  const lessons(this.chpNum, {super.key});

//prop
  //static const String screenRout = 'lessonsList';

  @override
  State<lessons> createState() => _lessonsState(chpNum);
}

class _lessonsState extends State<lessons> {
  List<Object> _lessonsList = [];
  int chapNum = 0;

  _lessonsState(int chpNum) {
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
      appBar: AppBar(
        elevation: 0,
        title: const Text(
          'Lessons (change it)',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
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
        .get();

    setState(() {
      _lessonsList =
          List.from(data.docs.map((e) => LessonModle.fromSnapshot(e)));
    });
  }
}

class Lcard extends StatelessWidget {
  //const Lcard({super.key});

  final LessonModle _lesson;

  Lcard(this._lesson);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Card(
        color: kTextColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: const EdgeInsets.all(0.0),
          child: Column(children: [
            ListTile(
              title: Center(
                child: Text(
                  "${_lesson.id?.split(",")[0]}",
                  style: const TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => lessonCont(_lesson)));
              },
            ),
          ]),
        ),
      ),
    );
  }
}
