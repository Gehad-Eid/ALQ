// import 'package:alqgp/consts.dart';
// // import 'package:alqgp/models/lesson_model.dart';
// import 'package:dots_indicator/dots_indicator.dart';
// import 'package:easy_web_view2/easy_web_view2.dart';
// import 'package:flutter/material.dart';
// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:flutter_tts/flutter_tts.dart';

// class LessonContent extends StatefulWidget {
//   final LessonModle data;
//   const LessonContent(this.data, {super.key});

//   @override
//   State<LessonContent> createState() => _LessonContentState();
// }

// class _LessonContentState extends State<LessonContent> {
//   int currentIndex = 0;
//   bool isPlaying = false;
//   String _currentParagraph = '';
//   String get currentP => _currentParagraph;
//   FlutterTts flutterTts = FlutterTts();
//   @override
//   void initState() {
//     super.initState();
//     _currentParagraph =
//         '${widget.data.parts![0].topic} ${widget.data.parts![0].textList![0]}';
//     initTts();

//     flutterTts.setStartHandler(() {
//       setState(() {
//         isPlaying = true;
//       });
//     });

//     flutterTts.setCompletionHandler(() {
//       setState(() {
//         isPlaying = false;
//       });
//     });
//   }

//   initTts() async {
//     flutterTts = FlutterTts();
//   }

//   Future _readP() async {
//     await flutterTts.setVolume(1);
//     await flutterTts.setSpeechRate(.5);
//     await flutterTts.setPitch(1);
//     var result = await flutterTts.speak(currentP);
//     if (result == 1) {
//       setState(() {
//         isPlaying = true;
//       });
//     }
//   }

//   @override
//   void dispose() {
//     super.dispose();
//     flutterTts.stop();
//   }

//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     return SizedBox(
//       height: size.height,
//       child: Scaffold(
//         backgroundColor: kBackgroundColor,
//         appBar: AppBar(
//           iconTheme: const IconThemeData(color: Colors.black),
//           backgroundColor: kBackgroundColor,
//           //Color.fromARGB(255, 223, 115, 115)
//           elevation: 0,
//           title: Text(
//             "${widget.data.name?.split(",")[0]}",
//             style: const TextStyle(
//               fontSize: 23,
//               color: Colors.black,
//             ),
//           ),
//           centerTitle: true,
//         ),
//         body: SingleChildScrollView(
//           child: Column(children: [
//             const SizedBox(
//               height: 22,
//             ),
//             SizedBox(
//               width: double.infinity,
//               height: MediaQuery.of(context).size.height * 0.4,
//               child: EasyWebView(
//                 src: "${widget.data.name!.split(",")[1]}",
//                 onLoaded: () {}, // Try to convert to flutter widgets
//                 // width: 100,
//                 // height: 100,
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Column(
//                 children: [
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Text('${currentIndex + 1}/${widget.data.parts!.length}'),
//                       const SizedBox(),
//                     ],
//                   ),
//                   const SizedBox(
//                     height: 10,
//                   ),
//                   SizedBox(
//                       height: size.height * .5,
//                       child: CarouselSlider(
//                         items: widget.data.parts!.map((part) {
//                           return Builder(
//                             builder: (BuildContext context) {
//                               return Container(
//                                 padding: const EdgeInsets.all(10),
//                                 decoration: BoxDecoration(
//                                   color: Colors.amber.withOpacity(.2),
//                                 ),
//                                 child: SingleChildScrollView(
//                                   child: Column(
//                                     children: [
//                                       Row(
//                                         mainAxisAlignment:
//                                             MainAxisAlignment.end,
//                                         children: [
//                                           InkWell(
//                                             onTap: _readP,
//                                             child: Container(
//                                               padding:
//                                                   const EdgeInsets.all(8.0),
//                                               decoration: const BoxDecoration(
//                                                 color: kMainIconColore,
//                                                 shape: BoxShape.circle,
//                                               ),
//                                               child: const Icon(
//                                                 Icons.volume_up_sharp,
//                                                 color: Colors.white,
//                                                 size: 30,
//                                               ),
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                       Text(
//                                         '${part.topic}',
//                                         textAlign: TextAlign.left,
//                                         style: const TextStyle(
//                                           fontSize: 22.0,
//                                           fontWeight: FontWeight.bold,
//                                           //foreground: Paint()
//                                           color: Colors.black,
//                                         ),
//                                       ),
//                                       const SizedBox(
//                                         height: 20,
//                                       ),
//                                       Text(
//                                         part.textList![0],
//                                         textAlign: TextAlign.left,
//                                         style: const TextStyle(
//                                           fontSize: 20.0,
//                                           fontWeight: FontWeight.w500,
//                                           //foreground: Paint()
//                                           color: Colors.black,
//                                         ),
//                                       ),
//                                       const SizedBox(
//                                         height: 20,
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               );
//                             },
//                           );
//                         }).toList(),
//                         options: CarouselOptions(
//                           onPageChanged: (index, reason) {
//                             setState(() {
//                               currentIndex = index;
//                               _currentParagraph =
//                                   '${widget.data.parts![index].topic} ${widget.data.parts![index].textList![0]}';
//                             });
//                           },
//                           height: size.height * .2,
//                           aspectRatio: 1,
//                           viewportFraction: 1,
//                           initialPage: 0,
//                           enableInfiniteScroll: false,
//                           reverse: true,
//                           autoPlay: false,
//                           autoPlayInterval: const Duration(seconds: 3),
//                           autoPlayAnimationDuration:
//                               const Duration(milliseconds: 800),
//                           autoPlayCurve: Curves.decelerate,
//                           enlargeCenterPage: true,
//                           scrollDirection: Axis.horizontal,
//                           disableCenter: true,
//                         ),
//                       )),
//                   widget.data.parts!.length > 1
//                       ? DotsIndicator(
//                           dotsCount: widget.data.parts!.length,
//                           position: currentIndex.toDouble(),
//                           decorator: DotsDecorator(
//                             size: const Size.square(9.0),
//                             activeSize: const Size(18.0, 9.0),
//                             activeShape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(5.0)),
//                             activeColor: kMainIconColore,
//                           ),
//                           reversed: true,
//                         )
//                       : const SizedBox(),
//                   ListView.builder(
//                     shrinkWrap: true,
//                     physics: const NeverScrollableScrollPhysics(),
//                     itemCount: widget.data.parts!.length,
//                     itemBuilder: (context, index) {
//                       return Column(children: []);
//                     },
//                   ),
//                 ],
//               ),
//             ),
//           ]),
//         ),
//       ),
//     );
//   }
// }

// /*import 'package:alqgp/models/lesson_model.dart';
// // import 'package:easy_web_view2/easy_web_view2.dart';
// // import 'package:flutter/material.dart';

// class LessonContent extends StatelessWidget {
//   final LessonModle data;
//   const LessonContent(this.data, {super.key});

//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     return SingleChildScrollView(
//       child: Container(
//         child: Scaffold(
//           backgroundColor: Colors.white,
//           appBar: AppBar(
//             iconTheme: const IconThemeData(color: Colors.black),
//             backgroundColor: const Color.fromARGB(255, 156, 203, 247),
//             //Color.fromARGB(255, 223, 115, 115)
//             elevation: 0,
//             title: Text(
//               '${data.id?.split(",")[0]}',
//               style: const TextStyle(
//                 fontSize: 23,
//                 color: Colors.black,
//               ),
//             ),
//             centerTitle: true,
//           ),
//           body: Column(children: [
//             // const SizedBox(
//             //   height: 22,
//             // ),
//             Container(
//               width: double.infinity,
//               height: size.height * 0.4,
//               child: EasyWebView(
//                 src: data.id!.split(",")[1],
//                 onLoaded: () {}, // Try to convert to flutter widgets
//               ),
//             ),
//             const SizedBox(
//               width: double.infinity,
//               height: 50,
//             ),
//             Text(
//               '${data.id}',
//               textAlign: TextAlign.left,
//               style: const TextStyle(
//                 fontSize: 22.0,
//                 fontWeight: FontWeight.bold,
//                 //foreground: Paint()
//                 color: Color.fromARGB(255, 156, 203, 247),
//               ),
//             ),
//           ]),
//         ),
//       ),
//     );
//   }
// }


// /* 
// body: Column(children: [
//           SizedBox(
//               width: double.infinity,
//               height: 50,
//           ),
//           Text(
//             'Urinary System',
//             //textAlign: TextAlign.center,
//             style: const TextStyle(
//               fontSize: 30,
//               fontWeight: FontWeight.bold,
//               color: Color.fromARGB(255, 223, 115, 115),
//             ),
//           ),
//           SizedBox(
//             height: 40,
//           ),
//           Padding(
//             padding: EdgeInsets.only(left: 50, right: 50),
//             child:Text(
//               'What is the urinary system ?',
//               //textAlign: TextAlign.left,
//               style: TextStyle(
//               fontStyle: FontStyle.italic,
//               fontSize: 20,
//               fontWeight: FontWeight.bold,
//               //foreground: Paint()
//               color: Color.fromARGB(255, 223, 115, 115),
//             ),
//           ),
//           ),
          
//            SizedBox(
//             height: 10,
//           ),
//           Padding(
//             padding: EdgeInsets.only(left: 10),
//             child: Text(
//               'Urinary system is a body drainage system comprised of the group of organs that produce and excrete urine. It consists of the kidneys, ureters, urinary bladder and urethra.',
//               //textAlign: TextAlign.left,
//               style: TextStyle(
//               fontSize: 20,
//               fontWeight: FontWeight.bold,
//               //foreground: Paint()
//               color: Color.fromARGB(255, 156, 203, 247),
//             ),
//           ),
//           ),
          
// //           SizedBox(
// //               width: double.infinity,
// //               height: 30,
// //           ),
// //           Padding(
// //             padding: EdgeInsets.only(left: 50, right: 50),
// //             child: Text(
// //               'How dose the organs of this system work together? ',
// //               //textAlign: TextAlign.left,
// //               style: TextStyle(
// //               fontStyle: FontStyle.italic,
// //               fontSize: 20,
// //               fontWeight: FontWeight.bold,
// //               //foreground: Paint()
// //               color: Color.fromARGB(255, 223, 115, 115),
// //             ),
// //           ),
// //           ),
// //            SizedBox(
// //             height: 10,
// //           ),
// //           Padding(
// //             padding: EdgeInsets.only(left: 10, right: 10),
// //             child: Text(
// //               'Kidneys are paired bean-shaped organs placed retroperitoneally.\n\nThe kidneys have a rich blood supply provided by the renal artery.\n\nNephrons within the kidneys filter the blood that passes through their web of capillaries (glomerulus).\n\nThe blood filtrate then passes through a series of tubules and collecting ducts, eventually forming the final ultrafiltrate, urine. \n\nUrine passes into the ureters, tubes of smooth muscle that convey urine from the kidneys to the urinary bladder.\n\nThe bladder is a hollow muscular organ that collects and stores urine before disposal by urination (micturition).',
// //               //textAlign: TextAlign.left,
// //               style: TextStyle(
// //               fontSize: 20,
// //               fontWeight: FontWeight.bold,
// //               //foreground: Paint()
// //               color: Color.fromARGB(255, 156, 203, 247),
// //             ),
// //           ),
// //           ),
// //           SizedBox(
// //               width: double.infinity,
// //               height: 30,
// //           ),
// //           Padding(
// //             padding: EdgeInsets.only(left: 50, right: 50),
// //             child: Text(
// //               'The main functions',
// //               //textAlign: TextAlign.left,
// //               style: TextStyle(
// //               fontStyle: FontStyle.italic,
// //               fontSize: 20,
// //               fontWeight: FontWeight.bold,
// //               //foreground: Paint()
// //               color: Color.fromARGB(255, 223, 115, 115),
// //             ),
// //           ),
// //           ),
// //            SizedBox(
// //             height: 10,
// //           ),
// //           Padding(
// //             padding: EdgeInsets.only(left: 10, right: 10),
// //             child: Text(
// //               'Functions of the urinary system include; elimination of body waste, regulation of blood volume and blood pressure, regulation of electrolyte levels and blood pH.',
// //               //textAlign: TextAlign.left,
// //               style: TextStyle(
// //               fontSize: 20,
// //               fontWeight: FontWeight.bold,
// //               //foreground: Paint()
// //               color: Color.fromARGB(255, 156, 203, 247),
// //             ),
// //           ),
// //           ),
// //         ]),
// //       ),
// //     ));
// //   }
// // }*/

// // /*
// // '${data.des?.replaceAll("\\n", "\n")}',
// //             //'What is the urinary system?\nUrinary system is a body drainage system comprised of the group of organs that produce and excrete urine. It consists of the kidneys, ureters, urinary bladder and urethra.\nHow does the organs of this system work together?!\nKidneys are paired bean-shaped organs placed retroperitoneally. The kidneys have a rich blood supply provided by the renal artery.\n\nThe main functions:\nNephrons within the kidneys filter the blood that passes through their web of capillaries (glomerulus). The blood filtrate then passes through a series of tubules and collecting ducts, eventually forming the final ultrafiltrate, urine.\nUrine passes into the ureters, tubes of smooth muscle that convey urine from the kidneys to the urinary bladder. The bladder is a hollow muscular organ that collects and stores urine before disposal by urination (micturition).\nFunctions of the urinary system include; elimination of body waste, regulation of blood volume and blood pressure, regulation of electrolyte levels and blood pH.',
// //             style: TextStyle(fontSize: 20.0),
  


// */
// /*
// Padding(

// // //             padding: EdgeInsets.only(left: 50, right: 50),

// // //             child: Text(

// // //               'The main functions',

// // //               //textAlign: TextAlign.left,

// // //               style: TextStyle(

// // //               fontStyle: FontStyle.italic,

// // //               fontSize: 20,

// // //               fontWeight: FontWeight.bold,

//               //foreground: Paint()

// // //               color: Color.fromARGB(255, 223, 115, 115),

// // //             ),

//           ),

// // //           ),

// // //            SizedBox(

//             height: 10,

//           ),

//           Padding(

//             padding: EdgeInsets.only(left: 10, right: 10),

//             child: Text(

//               'Functions of the urinary system include; elimination of body waste, regulation of blood volume and blood pressure, regulation of electrolyte levels and blood pH.',

//               //textAlign: TextAlign.left,

//               style: TextStyle(

//               fontSize: 20,

//               fontWeight: FontWeight.bold,

//               //foreground: Paint()

//               color: Color.fromARGB(255, 156, 203, 247),

//             ),

//           ),
// */
