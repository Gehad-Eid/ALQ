import 'package:alqgp/consts.dart';
import 'package:flutter/material.dart';
import 'package:alqgp/models/lesson_model.dart';
import 'package:easy_web_view2/easy_web_view2.dart';

class lessonCont extends StatelessWidget {
  final LessonModle lesson;
  const lessonCont(this.lesson, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Color.fromARGB(255, 243, 247, 248),
      appBar: AppBar(
        elevation: 0,
        title: Text(
          '${lesson.id?.split(",")[0]}',
          style:
              const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Color(0xFF8EA3E2),
      ),
      body: SingleChildScrollView(
        child: Expanded(
          child: Column(children: [
            Container(
              margin: const EdgeInsets.only(
                bottom: kPadding * 1.2,
              ),
              decoration: const BoxDecoration(
                color: Color(0xFF8EA3E2),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(29),
                  bottomRight: Radius.circular(29),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Container(
                  margin: const EdgeInsets.only(
                    bottom: kPadding - 5,
                  ),
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.33,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(20)),
                  child: EasyWebView(
                    src: lesson.id!.split(",")[1],
                    onLoaded: () {}, // Try to convert to flutter widgets
                  ),
                ),
              ),
            ),
            const Divider(),
            const SizedBox(
              width: double.infinity,
              height: 30,
            ),
            Container(
              height: 300,
              child: PageView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: lesson.parts?.length,
                itemBuilder: (context, index) {
                  return lessonCard(
                      title: lesson.parts!['part ${index + 1}'],
                      content: lesson.parts!['part ${index + 1}']);
                },
              ),
            )
          ]),
        ),
      ),
    );
  }
}

class lessonCard extends StatelessWidget {
  final String? title, content;
  const lessonCard({
    Key? key,
    required this.title,
    required this.content,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        decoration: BoxDecoration(
          color: kLightTextColor,
          borderRadius: BorderRadius.circular(16.0),
        ),
        width: size.width * 0.85,
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  child: const Icon(Icons.bookmark),
                  onTap: () {},
                ),
                GestureDetector(
                  child: const Icon(Icons.volume_up),
                  onTap: () {},
                ),
              ],
            ),
            Text(
              title!.split('+')[0],
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 22.0,
                fontWeight: FontWeight.bold,
                color: kTextColor,
              ),
            ),
            Text(
              content!.split('+')[1].replaceAll("\\n", "\n"),
              textAlign: TextAlign.left,
              style: const TextStyle(
                fontSize: 19.0,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
