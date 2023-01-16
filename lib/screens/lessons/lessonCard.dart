import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:matcher/matcher.dart';
import '../../models/lesson_model.dart';
import 'lesson_content.dart';

class Lcard extends StatelessWidget {
  //const Lcard({super.key});

  final LessonModle _lesson;

  Lcard(this._lesson);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Card(
        color: Color.fromARGB(255, 223, 115, 115),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: const EdgeInsets.all(0.0),
          child: Column(children: [
            ListTile(
              title: Center(
                child: Text(
                  //"${_lesson.id?.split(",")[0]}",
                  "${_lesson.name?.split(",")[0]}",
                  style: const TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => LessonContent(_lesson)));
              },
            ),
          ]),
        ),
      ),
    );
  }

  // return Padding(
  //   padding: EdgeInsets.symmetric(vertical: 4.0),
  //   child: Container(
  //     height: 90,
  //     color: Colors.blue,
  //     child: ListTile(
  //       title: Center(child: Text("${_lesson.id}")),
  //       onTap: () {
  //         Navigator.of(context).push(MaterialPageRoute(
  //             builder: (context) => LessonContent(_lesson)));
  //       },
  //     ),
  //   ),
  // );
}
