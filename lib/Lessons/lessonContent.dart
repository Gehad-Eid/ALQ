import 'package:alqgp/Chapters/chapterContent.dart';
import 'package:alqgp/consts.dart';
import 'package:alqgp/models/chapter_model.dart';
import 'package:alqgp/models/user_model.dart';
import 'package:alqgp/widgets/my_button.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:alqgp/models/lesson_model.dart';
import 'package:easy_web_view2/easy_web_view2.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'boookmarks.dart';

class lessonCont extends StatefulWidget {
  final LessonModle lesson;
  final UserModel loggedInUser;
  final List<Object> lessonsList;
  final int index;
  const lessonCont(this.lesson, this.index, this.lessonsList, this.loggedInUser,
      {super.key});

  @override
  State<lessonCont> createState() => _lessonContState(index);
}

enum TtsState { playing, stopped, paused, continued }

class _lessonContState extends State<lessonCont> {
  late FlutterTts flutterTts;
  String? language;
  String? engine;
  double volume = 0.5;
  double pitch = 1.0;
  double rate = 0.5;
  bool isCurrentLanguageInstalled = false;

  String? _newVoiceText;
  int? _inputLength;

  int currentIndex = 0;
  //bool isPlaying = false;
  String _currentParagraph = '';
  int? index;
  bool flag = false;

  _lessonContState(index) {
    this.index = index;
  }

  String get currentP => _currentParagraph;
  TtsState ttsState = TtsState.stopped;

  get isPlaying => ttsState == TtsState.playing;
  get isStopped => ttsState == TtsState.stopped;
  get isPaused => ttsState == TtsState.paused;
  get isContinued => ttsState == TtsState.continued;

  @override
  void initState() {
    super.initState();
    _currentParagraph =
        '${widget.lesson.parts![0].topic} ${widget.lesson.parts![0].textList![0]}';
    initTts();

    flutterTts.setStartHandler(() {
      setState(() {
        ttsState = TtsState.playing;
      });
    });

    flutterTts.setCompletionHandler(() {
      setState(() {
        ttsState = TtsState.stopped;
      });
    });
  }

  Future _setAwaitOptions() async {
    await flutterTts.awaitSpeakCompletion(true);
  }

  Future _getDefaultEngine() async {
    var engine = await flutterTts.getDefaultEngine;
    if (engine != null) {
      print(engine);
    }
  }

  Future _getDefaultVoice() async {
    var voice = await flutterTts.getDefaultVoice;
    if (voice != null) {
      print(voice);
    }
  }

  initTts() async {
    flutterTts = FlutterTts();
    _setAwaitOptions();
    _getDefaultEngine();
    _getDefaultVoice();

    flutterTts.setStartHandler(() {
      setState(() {
        print("Playing");
        ttsState = TtsState.playing;
      });
    });
    flutterTts.setInitHandler(() {
      setState(() {
        print("TTS Initialized");
      });
    });

    flutterTts.setCompletionHandler(() {
      setState(() {
        print("Complete");
        ttsState = TtsState.stopped;
      });
    });

    flutterTts.setCancelHandler(() {
      setState(() {
        print("Cancel");
        ttsState = TtsState.stopped;
      });
    });

    flutterTts.setPauseHandler(() {
      setState(() {
        print("Paused");
        ttsState = TtsState.paused;
      });
    });

    flutterTts.setContinueHandler(() {
      setState(() {
        print("Continued");
        ttsState = TtsState.continued;
      });
    });

    flutterTts.setErrorHandler((msg) {
      setState(() {
        print("error: $msg");
        ttsState = TtsState.stopped;
      });
    });
  }

  Future _speak() async {
    await flutterTts.setVolume(volume);
    await flutterTts.setSpeechRate(rate);
    await flutterTts.setPitch(pitch);

    if (currentP != null) {
      if (currentP.isNotEmpty) {
        await flutterTts.speak(currentP);
      }
    }
  }

  Future _stop() async {
    var result = await flutterTts.stop();
    if (result == 1) setState(() => ttsState = TtsState.stopped);
  }

  Future _pause() async {
    var result = await flutterTts.pause();
    if (result == 1) setState(() => ttsState = TtsState.paused);
  }

  Future _readP() async {
    await flutterTts.setVolume(1);
    await flutterTts.setSpeechRate(.5);
    await flutterTts.setPitch(1);
    var result = await flutterTts.speak(currentP);
    if (result == 1) {
      setState(() {
        ttsState = TtsState.playing;
      });
    }
  }

  @override
  void dispose() {
    flutterTts.stop();
    super.dispose();
  }

  // bool? flag = lessonn.BookmarkValus;
  Color bookcolor = Colors.black;

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
            // style: const TextStyle(
            //     color: Colors.black, fontWeight: FontWeight.bold),
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
                              var _favIconColor = Colors.grey;
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
                                          GestureDetector(
                                            child: Icon(
                                              Icons.bookmark,
                                              color: bookcolor,
                                            ),
                                            onTap: (() {
                                              flag = !flag;
                                              onbookmark();
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
                  // ListView.builder(
                  //   shrinkWrap: true,
                  //   physics: const NeverScrollableScrollPhysics(),
                  //   itemCount: widget.lesson.parts!.length,
                  //   itemBuilder: (context, index) {
                  //     return Column(children: []);
                  //   },
                  // ),
                  // currentIndex == widget.lesson.parts!.length
                  //     ? MyButton(
                  //         color: Color.fromARGB(255, 223, 115, 115),
                  //         title: 'Log in',
                  //         onPressed: () {},
                  //       )
                  //     : SizedBox(),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Visibility(
                    maintainSize: true,
                    maintainAnimation: true,
                    maintainState: true,
                    visible: (currentIndex.toDouble() ==
                        widget.lesson.parts!.length - 1),
                    child: ElevatedButton(
                      child: Text(
                          index == -1 || index! >= widget.lessonsList.length - 1
                              ? 'Finish!'
                              : 'Next'),
                      onPressed: () {
                        FirebaseFirestore.instance
                            .collection('student')
                            .doc('${widget.loggedInUser.uid}')
                            .update({'ch2': widget.loggedInUser.ch1! + 1});
                        if (index == -1 ||
                            index! >= widget.lessonsList.length - 1) {
                          Navigator.of(context)
                              .popUntil(ModalRoute.withName("/ChapCon"));
                        } else {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => lessonCont(
                                      widget.lessonsList[index! + 1]
                                          as LessonModle,
                                      index! + 1,
                                      widget.lessonsList,
                                      widget.loggedInUser)));
                        }
                      },
                    ),
                  ),
                  const SizedBox(height: 10)
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }

  void onbookmark() {
    if (flag == true) {
      bookcolor = Color.fromARGB(155, 165, 71, 197);
    } else {
      bookcolor = Colors.black;
    }
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
