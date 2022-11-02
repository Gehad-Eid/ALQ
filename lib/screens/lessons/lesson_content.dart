import 'package:alqgp/models/lesson_model.dart';
import 'package:flutter/material.dart';

class LessonContent extends StatelessWidget {
  final LessonModle data;
  const LessonContent(this.data, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${data.id}'),
      ),
      body: Column(children: [
        Text('${data.title}'),
        Text('${data.des}'),
      ]),
    );
  }
}
