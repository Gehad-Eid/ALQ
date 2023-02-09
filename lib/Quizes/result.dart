//import 'dart:js';



import 'package:alqgp/Chapters/chapter.dart';
import 'package:alqgp/Chapters/chapterContent.dart';
import 'package:alqgp/Main/home.dart';
import 'package:alqgp/models/chapter_model.dart';
import 'package:flutter/material.dart';

class result extends StatelessWidget {
  final int score;
  const result(this.score, {super.key});

  // @override
  // Widget build(BuildContext context) {
  //   return Container();

// class chapterContent extends StatefulWidget {
//   final int chapter;
//   const chapterContent(this.chapter, {super.key});

//   @override
//   State<chapterContent> createState() => chaptersContent();
// }

// class chaptersContent extends State<chapterContent> {
// String? _chapterName;

//   @override
//   void didChangeDependencies() {
//     super.didChangeDependencies();
//     getLessonsList();
//   }

  @override
  Widget build(BuildContext context) {
    final BuildContext path = context;
    buildAppBar(context);
    return Scaffold(
        //backgroundColor: Color.fromARGB(255, 156, 203, 247),
        //drawer: NavigationDrawer(),
        appBar: buildAppBar(context),
        body: //Body(),
            SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 22,
                ),
                const Text.rich(
                  (TextSpan(
                      text: 'Your result out of 10',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 28,
                          color: Color.fromARGB(155, 165, 71, 197),),
                      children: [
                        TextSpan(
                          text: ' 👏',
                          //text: '  🤨📙✨',
                          style: TextStyle(
                              fontWeight: FontWeight.normal, fontSize: 30.0),
                        )
                      ])),
                  //style: TextStyle(fontSize: 30.0),
                ),
                const SizedBox(
                  height: 40,
                ),
                ////////////
                ///
                Center(
                  child: Text.rich(
                    (TextSpan(
                        text: '$score/10',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 80.0, color: Color(0xFF8EA3E2).withOpacity(0.75),),
                        children: [])),
                    //style: TextStyle(fontSize: 30.0),
                  ),
                ),
                buildAbout3(),
              ],
            ),
          ),
        )

        // Stack(
        //   children: [
        //     // Container(
        //     //   decoration: BoxDecoration(
        //     //     image: DecorationImage(
        //     //       image: AssetImage("images/backgraund4.png"),
        //     //       fit: BoxFit.cover,
        //     //     ),
        //     //   ),
        //     //   child: null /* add child content here */,
        //     // ),
        //     Body(),
        //   ],
        // ),
        );
  }

  Widget buildAbout3() => Container(
        padding: EdgeInsets.all(30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                const SizedBox(height: 100,),
                Container(
                  height: 180,
                  child: Image.asset('images/result.png'),
                ),
          ],
            ),
          ],
        ),
      );

  AppBar buildAppBar(context) {
    return AppBar(
        title: const Text(
          "The Result",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
        elevation: 0,
        centerTitle: true,
        backgroundColor: Color(0xFF8EA3E2),
        leading: IconButton(
                onPressed: () => Navigator.push(context, MaterialPageRoute(
            builder: (context) {
              return homePage();
            },
          )),
                icon: const Icon(
                  Icons.arrow_back,
                  size: 25.0,
                  color: Colors.white,
                ),
              ),
        // leading: new IconButton(
        //   icon: new Icon(Icons.ac_unit),
        //   onPressed: () => Navigator.of().push(MaterialPageRoute(builder: (context) => page));,

      // iconTheme: IconThemeData(color: Colors.black),
      // backgroundColor: Color.fromARGB(255, 156, 203, 247),
      // //Color.fromARGB(255, 223, 115, 115)
      // elevation: 0,
      /*
      logo
      leading: IconButton(
        iconSize: 100,
        icon: Image.asset("images/logo.jpeg"),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const header()),
          );
        },
      ),
      */
      // title: const Text(
      //   "ALQ",
      //   style: TextStyle(
      //     fontSize: 23,
      //     color: Colors.black,
      //   ),
      // ),
      // centerTitle: true,
    );
    // actions: [
    //   IconButton(
    //     icon: Image.asset('images/profile3.png'),
    //     onPressed: () => {
    //       Navigator.push(context,
    //           MaterialPageRoute(builder: (context) => ProfileScreen()))
    //     }, //go to profile page
    //   ),
    // ],
  }
}

//  Future getChapter() async {
//     //final uid = auth(

//     var data = await FirebaseFirestore.instance
//         .collection('chapters')
//         .doc('Chapter 4')
//         .collection('Lessons')
//         .orderBy('name')
//         .get();

//     setState(() {
//       _lessonsList =
//           List.from(data.docs.map((e) => LessonModle.fromSnapshot(e)));
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: buildAppBar(),
//       body: Stack(
//         children: [
//           Container(
//             decoration: BoxDecoration(
//               image: DecorationImage(
//                 image: AssetImage("images/backgraund4.png"),
//                 fit: BoxFit.cover,
//               ),
//             ),
//           ),
//           Body2(),
//         ],
//       ),
//     );
//   }

//   AppBar buildAppBar() {
//     return AppBar(
//       iconTheme: IconThemeData(color: Colors.black),
//       backgroundColor: Color.fromARGB(255, 245, 243, 242),
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
//   }
// }
//chpters

//https://www.youtube.com/watch?v=dx3gj5hz6HU
