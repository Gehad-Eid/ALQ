import 'package:alqgp/models/lesson_model.dart';
import 'package:flutter/material.dart';

class LessonContent extends StatelessWidget {
  final LessonModle data;
  const LessonContent(this.data, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 156, 203, 247),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Color.fromARGB(255, 156, 203, 247),
        //Color.fromARGB(255, 223, 115, 115)
        elevation: 0,
        title: Text(
          "${data.id}",
          style: TextStyle(
            fontSize: 23,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
      ),
      // appBar: AppBar(
      //   title: Text('${data.id}'),
      // ),
      body: Column(children: [
        SizedBox(
          height: 22,
        ),
        Text(
          '${data.title}',
          textAlign: TextAlign.left,
          style: TextStyle(
            fontSize: 22.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: 15,
        ),
        Text(
          '${data.des}',
          style: TextStyle(fontSize: 20.0),
        ),
      ]),
    );
  }
}
