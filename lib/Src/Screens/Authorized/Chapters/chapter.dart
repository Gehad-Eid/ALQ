import 'package:alqgp/Src/Models/lesson_model.dart';
import 'package:alqgp/Src/Utils/Consts/consts.dart';
import 'package:alqgp/Src/controllers/chapter_controller.dart';
import 'package:alqgp/Src/Screens/Authorized/Chapters/widgets/chapterHeader_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Chaptercontent extends StatelessWidget {
  const Chaptercontent({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ChapterController());
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        //scan and back

        body: SingleChildScrollView(
          // child: Container(
          // padding: const EdgeInsets.all(tDefaultSize),
          child: FutureBuilder(
            future: controller.getAllLessons(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasData) {
                  List<lesson> chapterData = snapshot.data as List<lesson>;
                  return Column(
                    children: [
                      //fullscreen in 3D
                      lessonCardWithIndicatorAndModel(
                          size, chapterData, controller),
                      const SizedBox(height: tDefaultPadding),
                      const Divider(),
                      const SizedBox(height: tDefaultPadding),
                      //header and boxes of organes
                      listofChap(chapterData),

                      //quiz btn
                    ],
                  );
                } else if (snapshot.hasError) {
                  return Center(child: Text(snapshot.error.toString()));
                } else {
                  return const Center(child: Text('Somthing went wrong.'));
                }
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            },
          ),
        ),
      ),
      // ),
    );
  }

  Container listofChap(List<lesson> chapterData) {
    return Container(
      child: ListView.builder(
          shrinkWrap: true,
          itemCount: 3,
          itemBuilder: (context, index) {
            return Column(
              children: [
                SizedBox(
                  child: Text("Name: ${chapterData[1].parts![index]}"),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(chapterData[index].id!),
                    // ListView.builder(
                    //   itemCount: chapterData[index].parts!.length,
                    //   itemBuilder: (context, i) {
                    //     Text(chapterData[index].parts![i]);
                    //   },
                    // )
                  ],
                ),
                const SizedBox(
                  height: 10,
                )
              ],
            );
          }),
    );
  }
}
