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
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 156, 203, 247),
        //drawer: NavigationDrawer(),
        appBar: buildAppBar(),
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
                      text: 'Score out of 10',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 30.0),
                      children: [
                        TextSpan(
                          text: ' ✨',
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
                            fontWeight: FontWeight.bold, fontSize: 80.0),
                        children: [])),
                    //style: TextStyle(fontSize: 30.0),
                  ),
                ),
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

  AppBar buildAppBar() {
    return AppBar(
      iconTheme: IconThemeData(color: Colors.black),
      backgroundColor: Color.fromARGB(255, 156, 203, 247),
      //Color.fromARGB(255, 223, 115, 115)
      elevation: 0,
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
      title: const Text(
        "ALQ",
        style: TextStyle(
          fontSize: 23,
          color: Colors.black,
        ),
      ),
      centerTitle: true,
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
