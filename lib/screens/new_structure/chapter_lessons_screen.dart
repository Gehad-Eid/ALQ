import 'package:alqgp/Lessons/lesson.dart';
import 'package:alqgp/consts.dart';
import 'package:alqgp/models/chapter_model.dart';
import 'package:alqgp/models/lesson_model.dart';
import 'package:alqgp/models/part_model.dart';
import 'package:alqgp/screens/lessons/lesson_content.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ChapterLessonsScreen extends StatefulWidget {
  Chapter? chapter;
  ChapterLessonsScreen({this.chapter});

  @override
  State<ChapterLessonsScreen> createState() => _ChapterLessonsScreenState();
}

class _ChapterLessonsScreenState extends State<ChapterLessonsScreen> {
  final CollectionReference _collectionRef =
      FirebaseFirestore.instance.collection('chapters');
  List<LessonModle> myLessons = [];
  Future<List<LessonModle>>? fLessons;

  Future<List<LessonModle>?> getChapterLessons() async {
    var data = await FirebaseFirestore.instance
        .collection('chapters')
        .doc('${widget.chapter?.docId}')
        .collection('Lessons')
        .get();
    List<Map<String, dynamic>> allData =
        data.docs.map((doc) => doc.data()).toList();
    myLessons.clear();
    for (int i = 0; i < allData.length; i++) {
      myLessons.add(LessonModle.fromMap(allData[i]));
    }
    return myLessons;
  }

  @override
  void initState() {
    fLessons = getChapterLessons() as Future<List<LessonModle>>?;
    fLessons!.then((value) {
      myLessons = value;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    getChapterLessons();
    return Scaffold(
        appBar: buildAppBar(),
        body: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 30.0, vertical: 20.0),
                child: FutureBuilder(
                    future: fLessons,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return GridView.builder(
                          itemCount: myLessons.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            //mainAxisSpacing: 5.0,
                            crossAxisSpacing: 20.0,
                            childAspectRatio: 0.75,
                          ),
                          itemBuilder: ((context, index) {
                            return InkWell(
                              onTap: () {
                                Navigator.push(context, MaterialPageRoute(
                                  builder: (context) {
                                    return LessonContent(myLessons[index]);
                                  },
                                ));
                              },
                              child: Column(
                                children: [
                                  Icon(
                                    Icons.menu_book_sharp,
                                    size: 60,
                                    color: Colors.blue,
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    myLessons[index].name!.substring(
                                        myLessons[index]
                                            .name!
                                            .indexOf(myLessons[index].name![0]),
                                        myLessons[index].name!.indexOf(',')),
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText1
                                        ?.copyWith(fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            );
                          }),
                        );
                      } else {
                        return SizedBox(
                          height: size.height * .8,
                          width: size.width,
                          child: Center(
                            child: Container(
                                width: 50,
                                height: 50,
                                child: CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                      Color.fromARGB(255, 155, 140, 181)),
                                  backgroundColor: Colors.deepPurple,
                                )),
                          ),
                        );
                      }
                    }),
              ),
            ),
          ],
        ));
  }

  AppBar buildAppBar() {
    return AppBar(
      iconTheme: const IconThemeData(color: Colors.black),
      backgroundColor: kBackgroundColor,
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
    );
  }
}
