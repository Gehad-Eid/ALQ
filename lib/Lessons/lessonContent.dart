import 'package:alqgp/consts.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:alqgp/models/lesson_model.dart';
import 'package:easy_web_view2/easy_web_view2.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'boookmarks.dart';

class lessonCont extends StatefulWidget {
  final LessonModle lesson;
  const lessonCont(this.lesson, {super.key});

  @override
  State<lessonCont> createState() => _lessonContState();
}

class _lessonContState extends State<lessonCont> {
  int currentIndex = 0;
  bool isPlaying = false;
  String _currentParagraph = '';
  String get currentP => _currentParagraph;
  FlutterTts flutterTts = FlutterTts();

  @override
  void initState() {
    super.initState();
    _currentParagraph =
        '${widget.lesson.parts![0].topic} ${widget.lesson.parts![0].textList![0]}';
    initTts();

    flutterTts.setStartHandler(() {
      setState(() {
        isPlaying = true;
      });
    });

    flutterTts.setCompletionHandler(() {
      setState(() {
        isPlaying = false;
      });
    });
  }

  initTts() async {
    flutterTts = FlutterTts();
  }

  Future _readP() async {
    await flutterTts.setVolume(1);
    await flutterTts.setSpeechRate(.5);
    await flutterTts.setPitch(1);
    var result = await flutterTts.speak(currentP);
    if (result == 1) {
      setState(() {
        isPlaying = true;
      });
    }
  }

  @override
  void dispose() {
    super.dispose();
    flutterTts.stop();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height,
      child: Scaffold(
        backgroundColor: kBackgroundColor,
        appBar: AppBar(
          elevation: 0,
          title: Text(
            '${widget.lesson.name?.split(",")[0]}',
            style: const TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          backgroundColor: Color(0xFF8EA3E2),
        ),
        body: SingleChildScrollView(
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
                // boxShadow: [
                //   BoxShadow(
                //     offset: const Offset(0, 10),
                //     blurRadius: 50,
                //     color: Color(0xFF8EA3E2).withOpacity(0.75),
                //   )
                // ],
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
                    src: widget.lesson.name!.split(",")[1],
                    onLoaded: () {}, // Try to convert to flutter widgets
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  const SizedBox(
                    height: 40,
                  ),
                  SizedBox(
                      height: size.height * 0.39,
                      child: CarouselSlider(
                        items: widget.lesson.parts!.map((part) {
                          return Builder(
                            builder: (BuildContext context) {
                              return Container(
                                padding: const EdgeInsets.all(20),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16.0),
                                  color: kLightTextColor,
                                ),
                                child: SingleChildScrollView(
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          // InkWell(
                                          //   onTap: _readP,
                                          //   child: Container(
                                          //     padding:
                                          //         const EdgeInsets.all(8.0),
                                          //     decoration: const BoxDecoration(
                                          //       color: kTextColor,
                                          //       shape: BoxShape.circle,
                                          //     ),
                                          //     child: const Icon(
                                          //       Icons.volume_up_sharp,
                                          //       color: Colors.white,
                                          //       size: 30,
                                          //     ),
                                          //   ),
                                          // ),
                                          GestureDetector(
                                            child: const Icon(Icons.bookmark),
                                            onTap: (() {
                                            }),
                                          ),
                                          GestureDetector(
                                            child: Icon(Icons.volume_up),
                                            onTap: _readP,
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        part.topic!,
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(
                                          fontSize: 22.0,
                                          fontWeight: FontWeight.bold,
                                          color: kTextColor,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      Text(
                                        part.textList![0]
                                            .replaceAll("\\n", "\n"),
                                        textAlign: TextAlign.left,
                                        style: const TextStyle(
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                        }).toList(),
                        options: CarouselOptions(
                          onPageChanged: (index, reason) {
                            setState(() {
                              currentIndex = index;
                              _currentParagraph =
                                  '${widget.lesson.parts![index].topic} ${widget.lesson.parts![index].textList![0]}';
                            });
                          },
                          height: size.height * 0.2,
                          aspectRatio: 1,
                          viewportFraction: 1,
                          initialPage: 0,
                          enableInfiniteScroll: false,
                          autoPlay: false,
                          autoPlayInterval: const Duration(seconds: 3),
                          autoPlayAnimationDuration:
                              const Duration(milliseconds: 800),
                          autoPlayCurve: Curves.decelerate,
                          enlargeCenterPage: true,
                          scrollDirection: Axis.horizontal,
                          disableCenter: true,
                        ),
                      )),
                  widget.lesson.parts!.length > 1
                      ? DotsIndicator(
                          dotsCount: widget.lesson.parts!.length,
                          position: currentIndex.toDouble(),
                          decorator: DotsDecorator(
                            size: const Size.square(9.0),
                            activeSize: const Size(18.0, 9.0),
                            activeShape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.0)),
                            activeColor: kTextColor,
                          ),
                        )
                      : const SizedBox(),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: widget.lesson.parts!.length,
                    itemBuilder: (context, index) {
                      return Column(children: []);
                    },
                  ),
                  // const SizedBox(
                  //   height: 50,
                  // ),
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       //backgroundColor: Color.fromARGB(255, 243, 247, 248),
//       appBar: AppBar(
//         elevation: 0,
//         title: Text(
//           '${lesson.id?.split(",")[0]}',
//           style:
//               const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
//         ),
//         centerTitle: true,
//         backgroundColor: Color(0xFF8EA3E2),
//       ),
//       body: SingleChildScrollView(
//         child: Expanded(
//           child: Column(children: [
//             Container(
//               margin: const EdgeInsets.only(
//                 bottom: kPadding * 1.2,
//               ),
//               decoration: const BoxDecoration(
//                 color: Color(0xFF8EA3E2),
//                 borderRadius: BorderRadius.only(
//                   bottomLeft: Radius.circular(29),
//                   bottomRight: Radius.circular(29),
//                 ),
//               ),
//               child: Padding(
//                 padding: const EdgeInsets.all(5.0),
//                 child: Container(
//                   margin: const EdgeInsets.only(
//                     bottom: kPadding - 5,
//                   ),
//                   width: double.infinity,
//                   height: MediaQuery.of(context).size.height * 0.33,
//                   decoration:
//                       BoxDecoration(borderRadius: BorderRadius.circular(20)),
//                   child: EasyWebView(
//                     src: lesson.id!.split(",")[1],
//                     onLoaded: () {}, // Try to convert to flutter widgets
//                   ),
//                 ),
//               ),
//             ),
//             const Divider(),
//             const SizedBox(
//               width: double.infinity,
//               height: 30,
//             ),
//             Container(
//               height: 300,
//               child: PageView.builder(
//                 scrollDirection: Axis.horizontal,
//                 itemCount: lesson.parts?.length,
//                 itemBuilder: (context, index) {
//                   return lessonCard(
//                       title: lesson.parts!['part ${index + 1}'],
//                       content: lesson.parts!['part ${index + 1}']);
//                 },
//               ),
//             )
//           ]),
//         ),
//       ),
//     );
//   }
// }
// class lessonCard extends StatelessWidget {
//   final String? title, content;
//   const lessonCard({
//     Key? key,
//     required this.title,
//     required this.content,
//   }) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 20),
//       child: Container(
//         decoration: BoxDecoration(
//           color: kLightTextColor,
//           borderRadius: BorderRadius.circular(16.0),
//         ),
//         width: size.width * 0.85,
//         height: 300,
//         padding: const EdgeInsets.all(20),
//         child: SingleChildScrollView(
//           child: Column(
//             children: [
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   GestureDetector(
//                     child: const Icon(Icons.bookmark),
//                     onTap: () {},
//                   ),
//                   GestureDetector(
//                     child: const Icon(Icons.volume_up),
//                     onTap: () {},
//                   ),
//                 ],
//               ),
//               Text(
//                 title!.split('+')[0],
//                 textAlign: TextAlign.center,
//                 style: const TextStyle(
//                   fontSize: 22.0,
//                   fontWeight: FontWeight.bold,
//                   color: kTextColor,
//                 ),
//               ),
//               Text(
//                 content!.split('+')[1].replaceAll("\\n", "\n"),
//                 textAlign: TextAlign.left,
//                 style: const TextStyle(
//                   fontSize: 19.0,
//                   color: Colors.black,
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
