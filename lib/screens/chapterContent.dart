// import 'package:alqgp/Quizes/quiz.dart';
// import 'package:alqgp/screens/profile.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:alqgp/screens/chapters.dart';
// import 'package:alqgp/screens/body.dart';
// import '../models/chapter_model.dart';
// import 'lessons/lessonsList.dart';

// class chapterContent extends StatelessWidget {
//   final int chapter;
//   const chapterContent(this.chapter, {super.key});

//   // @override
//   // Widget build(BuildContext context) {
//   //   return Container();

// // class chapterContent extends StatefulWidget {
// //   final int chapter;
// //   const chapterContent(this.chapter, {super.key});

// //   @override
// //   State<chapterContent> createState() => chaptersContent();
// // }

// // class chaptersContent extends State<chapterContent> {
// // String? _chapterName;

// //   @override
// //   void didChangeDependencies() {
// //     super.didChangeDependencies();
// //     getLessonsList();
// //   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         backgroundColor: Color.fromARGB(255, 156, 203, 247),
//         //drawer: NavigationDrawer(),
//         appBar: buildAppBar(),
//         body: //Body(),
//             SingleChildScrollView(
//           child: Padding(
//             padding: EdgeInsets.symmetric(horizontal: 30.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 SizedBox(
//                   height: 22,
//                 ),
//                 Text.rich(
//                   (TextSpan(
//                       text: 'Chapter $chapter',
//                       style: TextStyle(
//                           fontWeight: FontWeight.bold, fontSize: 30.0),
//                       children: [
//                         TextSpan(
//                           text: ' ✨',
//                           style: TextStyle(
//                               fontWeight: FontWeight.normal, fontSize: 30.0),
//                         )
//                       ])),
//                   //style: TextStyle(fontSize: 30.0),
//                 ),
//                 SizedBox(
//                   height: 40,
//                 ),
//                 ////////////
//                 ///
//                 Container(
//                   height: 200,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(20),
//                   ),
//                   child: GridView.builder(
//                     physics: const NeverScrollableScrollPhysics(),
//                     gridDelegate:
//                         const SliverGridDelegateWithFixedCrossAxisCount(
//                             crossAxisCount: 2),
//                     itemCount: 2,
//                     itemBuilder: (BuildContext context, int index) {
//                       return GestureDetector(
//                         onTap: () {
//                           Navigator.of(context).push(MaterialPageRoute(
//                               builder: (context) => Lessons(chapter)));
//                         },
//                         child: const Card(
//                             //   child: Stack(
//                             //     alignment: FractionalOffset.bottomCenter,
//                             //     children: <Widget>[
//                             //       Container(
//                             //         decoration: BoxDecoration(
//                             //           borderRadius: BorderRadius.circular(20),
//                             //           image: DecorationImage(
//                             //               image: AssetImage(
//                             //                   chapItems[index].itemImage),
//                             //               fit: BoxFit.fitHeight),
//                             //         ),
//                             //       ),
//                             //       Container(
//                             //         alignment: Alignment.center,
//                             //         height: 30.0,
//                             //         color: Color.fromARGB(255, 223, 115, 115),
//                             //         child: Text(
//                             //           chapItems[index].itemName,
//                             //           style: TextStyle(
//                             //               fontWeight: FontWeight.w700,
//                             //               fontSize: 16.0,
//                             //               color: Colors.white),
//                             //         ),
//                             //       )
//                             //     ],
//                             //   ),
//                             ),
//                       );
//                     },
//                   ),
//                 ),
//                 const SizedBox(
//                   height: 40,
//                 ),
//                 Container(
//                   height: 50,
//                   child: InkWell(
//                     onTap: (){
//                       Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) { 
//                         return quiz_page(chap: chapter,);
//                        }));
//                     },
//                     child: Card(
//                         child: Container(
//                       alignment: Alignment.center,
//                       height: 30.0,
//                       color: const Color.fromARGB(255, 161, 161, 161),
//                       child: const Text(
//                         'Quiz',
//                         style: TextStyle(
//                             fontWeight: FontWeight.w700,
//                             fontSize: 16.0,
//                             color: Colors.white),
//                       ),
//                     )),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         )

//         // Stack(
//         //   children: [
//         //     // Container(
//         //     //   decoration: BoxDecoration(
//         //     //     image: DecorationImage(
//         //     //       image: AssetImage("images/backgraund4.png"),
//         //     //       fit: BoxFit.cover,
//         //     //     ),
//         //     //   ),
//         //     //   child: null /* add child content here */,
//         //     // ),
//         //     Body(),
//         //   ],
//         // ),
//         );
//   }

//   AppBar buildAppBar() {
//     return AppBar(
//       iconTheme: const IconThemeData(color: Colors.black),
//       backgroundColor: const Color.fromARGB(255, 156, 203, 247),
//       //Color.fromARGB(255, 223, 115, 115)
//       elevation: 0,
//       /*
//       logo
//       leading: IconButton(
//         iconSize: 100,
//         icon: Image.asset("images/logo.jpeg"),
//         onPressed: () {
//           Navigator.push(
//             context,
//             MaterialPageRoute(builder: (context) => const header()),
//           );
//         },
//       ),
//       */
//       title: const Text(
//         "ALQ",
//         style: TextStyle(
//           fontSize: 23,
//           color: Colors.black,
//         ),
//       ),
//       centerTitle: true,
//     );
//     // actions: [
//     //   IconButton(
//     //     icon: Image.asset('images/profile3.png'),
//     //     onPressed: () => {
//     //       Navigator.push(context,
//     //           MaterialPageRoute(builder: (context) => ProfileScreen()))
//     //     }, //go to profile page
//     //   ),
//     // ],
//   }
// }


// //  Future getChapter() async {
// //     //final uid = auth(

// //     var data = await FirebaseFirestore.instance
// //         .collection('chapters')
// //         .doc('Chapter 4')
// //         .collection('Lessons')
// //         .orderBy('name')
// //         .get();

// //     setState(() {
// //       _lessonsList =
// //           List.from(data.docs.map((e) => LessonModle.fromSnapshot(e)));
// //     });
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: buildAppBar(),
// //       body: Stack(
// //         children: [
// //           Container(
// //             decoration: BoxDecoration(
// //               image: DecorationImage(
// //                 image: AssetImage("images/backgraund4.png"),
// //                 fit: BoxFit.cover,
// //               ),
// //             ),
// //           ),
// //           Body2(),
// //         ],
// //       ),
// //     );
// //   }

// //   AppBar buildAppBar() {
// //     return AppBar(
// //       iconTheme: IconThemeData(color: Colors.black),
// //       backgroundColor: Color.fromARGB(255, 245, 243, 242),
// //       elevation: 0,
// //       /*
// //       logo
// //       leading: IconButton(
// //         iconSize: 100,
// //         icon: Image.asset("images/logo.jpeg"),
// //         onPressed: () {
// //           Navigator.push(
// //             context,
// //             MaterialPageRoute(builder: (context) => const header()),
// //           );
// //         },
// //       ),
// //       */
// //       title: const Text(
// //         "ALQ",
// //         style: TextStyle(
// //           fontSize: 23,
// //           color: Colors.black,
// //         ),
// //       ),
// //       centerTitle: true,
// //     );
// //   }
// // }
// //chpters


// //https://www.youtube.com/watch?v=dx3gj5hz6HU