import 'package:alqgp/Src/Widgets/the3Dmodel.dart';
import 'package:alqgp/Src/controllers/lesson_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'lessonArea.dart';

class Lesson extends StatelessWidget {
  const Lesson({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LessonController());
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            // the 3D model
            modelWidget(size.height * 0.85,
                controller.lessonContent.nameAndModle!.split(",")[1]),

            // the lesson area
            lessonArea(size, controller),
          ],
        ),
      ),
    );
  }
}
