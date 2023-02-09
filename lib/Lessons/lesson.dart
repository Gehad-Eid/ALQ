// import 'package:alqgp/models/chapter_model.dart';
// import 'package:alqgp/models/lesson_model.dart';
// import 'package:alqgp/screens/lessons/lesson_content.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// class ChapterLessonsScreen extends StatefulWidget {
//   Chapter? chapter;
//   ChapterLessonsScreen({this.chapter});
//   @override
//   State<ChapterLessonsScreen> createState() => _ChapterLessonsScreenState();
// }
// class _ChapterLessonsScreenState extends State<ChapterLessonsScreen> {
//   final CollectionReference _collectionRef =
//       FirebaseFirestore.instance.collection('chapters');
//   List<LessonModle> myLessons = [];
//   Future<List<LessonModle>>? fLessons;
//   Future<List<LessonModle>?> getChapterLessons() async {
//     var data = await FirebaseFirestore.instance
//         .collection('chapters')
//         .doc('${widget.chapter?.docId}')
//         .collection('Lessons')
//         .get();
//     List<Map<String, dynamic>> allData =
//         data.docs.map((doc) => doc.data()).toList();
//     myLessons.clear();
//     for (int i = 0; i < allData.length; i++) {
//       myLessons.add(LessonModle.fromMap(allData[i]));
//     }
//     return myLessons;
//   }
//   @override
//   void initState() {
//     fLessons = getChapterLessons() as Future<List<LessonModle>>?;
//     fLessons!.then((value) {
//       myLessons = value;
//     });
//     super.initState();
//   }
//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     getChapterLessons();
//     return Scaffold(
//         appBar: AppBar(
//           elevation: 0,
//           title: const Text(
//             'Lessons (change it)',
//             style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
//           ),
//           centerTitle: true,
//           backgroundColor: Colors.transparent,
//         ),
//         body: Column(
//           children: [
//             Expanded(
//               child: Padding(
//                 padding: const EdgeInsets.symmetric(
//                     horizontal: 30.0, vertical: 20.0),
//                 child: FutureBuilder(
//                     future: fLessons,
//                     builder: (context, snapshot) {
//                       if (snapshot.hasData) {
//                         return GridView.builder(
//                           itemCount: myLessons.length,
//                           gridDelegate:
//                               const SliverGridDelegateWithFixedCrossAxisCount(
//                             crossAxisCount: 2,
//                             //mainAxisSpacing: 5.0,
//                             crossAxisSpacing: 20.0,
//                             childAspectRatio: 0.75,
//                           ),
//                           itemBuilder: ((context, index) {
//                             return InkWell(
//                               onTap: () {
//                                 Navigator.push(context, MaterialPageRoute(
//                                   builder: (context) {
//                                     return LessonContent(myLessons[index]);
//                                   },
//                                 ));
//                               },
//                               child: Column(
//                                 children: [
//                                   Icon(
//                                     Icons.menu_book_sharp,
//                                     size: 60,
//                                     color: Colors.blue,
//                                   ),
//                                   SizedBox(
//                                     height: 20,
//                                   ),
//                                   Text(
//                                     myLessons[index].name!.substring(
//                                         myLessons[index]
//                                             .name!
//                                             .indexOf(myLessons[index].name![0]),
//                                         myLessons[index].name!.indexOf(',')),
//                                     style: Theme.of(context)
//                                         .textTheme
//                                         .bodyText1
//                                         ?.copyWith(fontWeight: FontWeight.bold),
//                                   )
//                                 ],
//                               ),
//                             );
//                           }),
//                         );
//                       } else {
//                         return SizedBox(
//                           height: size.height * .8,
//                           width: size.width,
//                           child: Center(
//                             child: Container(
//                                 width: 50,
//                                 height: 50,
//                                 child: CircularProgressIndicator(
//                                   valueColor: AlwaysStoppedAnimation<Color>(
//                                       Color.fromARGB(255, 155, 140, 181)),
//                                   backgroundColor: Colors.deepPurple,
//                                 )),
//                           ),
//                         );
//                       }
//                     }),
//               ),
//             ),
//           ],
//         ));
//   }
// }

import 'package:alqgp/Lessons/lessonContent.dart';
import 'package:alqgp/consts.dart';
import 'package:alqgp/models/chapter_model.dart';
import 'package:alqgp/models/lesson_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class lessons extends StatefulWidget {
  final Chapter chap;
  const lessons({super.key, required this.chap});
//prop
  //static const String screenRout = 'lessonsList';
  @override
  State<lessons> createState() => _lessonsState(chap);
}

class _lessonsState extends State<lessons> {
  List<Object> lessonsList = [];
  int chapNum = 0;
  String chpName = '';
  Chapter? chap;
  _lessonsState(Chapter chap) {
    this.chap = chap;
    chapNum = chap.chapNum;
    chpName = chap.chapterName;
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
        title: Text(
          chpName,
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
      ),
      body: SafeArea(
          child: ListView.builder(
              itemCount: lessonsList.length,
              itemBuilder: (context, index) {
                return index < lessonsList.length - 1
                    ? Lcard(
                        lessonsList[index] as LessonModle,
                        lessonsList[index + 1] as LessonModle,
                        index,
                        chap!,
                        lessonsList)
                    : Lcard(
                        lessonsList[index] as LessonModle,
                        lessonsList[index] as LessonModle,
                        index,
                        chap!,
                        lessonsList);
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
      // _lessonsList = List.from(data.docs.map((e) => LessonModle.fromMap(e)));
      List<Map<String, dynamic>> allData =
          data.docs.map((doc) => doc.data()).toList();
      lessonsList.clear();
      for (int i = 0; i < allData.length; i++) {
        lessonsList.add(LessonModle.fromMap(allData[i]));
      }
    });
  }
}

class Lcard extends StatelessWidget {
  final LessonModle _lesson;
  final LessonModle _Next_lesson;
  final List<Object> lessonsList;
  final int index;
  final Chapter chap;
  Lcard(
      this._lesson, this._Next_lesson, this.index, this.chap, this.lessonsList);
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
                  // _lesson != _Next_lesson?
                  "${_lesson.name?.split(",")[0]}",
                  // : 'fouck',
                  style: const TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              onTap: () {
                _lesson != _Next_lesson
                    ? Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) =>
                            lessonCont(_lesson, index, lessonsList)))
                    : Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) =>
                            lessonCont(_lesson, -1, lessonsList)));
              },
            ),
          ]),
        ),
      ),
    );
  }
}
