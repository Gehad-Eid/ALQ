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
    return Container(
      child: Card(
        child: ListTile(
          title: Text("${_lesson.id}"),
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => LessonContent(_lesson)));
          },
        ),
      ),
    );
  }
}
