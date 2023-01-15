import 'dart:math';
import 'package:alqgp/Quizes/result.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:quiz_view/quiz_view.dart';
import 'package:timer_count_down/timer_controller.dart';
import 'package:timer_count_down/timer_count_down.dart';

class quiz_page extends StatelessWidget {
  final chap;
  const quiz_page({this.chap, super.key});

  @override
  Widget build(BuildContext context) {
    CollectionReference users = FirebaseFirestore.instance
        .collection('chapters')
        .doc('Chapter ${chap}')
        .collection('Quiz');
    PageController _page = PageController(initialPage: 1);
    CountdownController _count = CountdownController();
    int score = 0;
    int total = 0;

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 156, 203, 247),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Color.fromARGB(255, 156, 203, 247),
        actions: [
          Countdown(
            controller: _count,
            seconds: 10,
            build: (BuildContext context, double time) => Text(
              time.toString(),
              style: TextStyle(fontSize: 23),
            ),
            interval: Duration(milliseconds: 100),
            onFinished: () {
              if (total > 9) {
                Navigator.push(context,
                    MaterialPageRoute(builder: (BuildContext context) {
                  return result(score);
                }));
              } else {
                _page.nextPage(
                    duration: Duration(microseconds: 1),
                    curve: Curves.bounceIn);
                total += 1;
                print(total);
                _count.restart();
              }
            },
          )
        ],
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
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.79,
            child: FutureBuilder<DocumentSnapshot>(
              future: users.doc('Chapter 1 quiz').get(),
              builder: (BuildContext context,
                  AsyncSnapshot<DocumentSnapshot> snapshot) {
                if (snapshot.hasError) {
                  return Text("Something went wrong");
                }

                if (snapshot.hasData && !snapshot.data!.exists) {
                  return Text("Document does not exist");
                }

                if (snapshot.connectionState == ConnectionState.done) {
                  Map<String, dynamic> data =
                      snapshot.data!.data() as Map<String, dynamic>;
                  List<int> _data = [
                    1,
                    2,
                    3,
                    4,
                    5,
                    6,
                    7,
                    8,
                    9,
                    10,
                    11,
                    12,
                    13,
                    14,
                    15,
                    16,
                    17,
                    18,
                    19,
                    20
                  ];
                  final random = new Random();

                  int item = _data[random.nextInt(data.length)];
                  print(item);
                  var random_number = Random().nextInt(10);
                  return PageView.builder(
                    reverse: false,
                    pageSnapping: true,
                    controller: _page,
                    allowImplicitScrolling: true,
                    itemCount: 11,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        width: 300,
                        height: 600,
                        child: QuizView(
                          showCorrect: true,
                          tagBackgroundColor: Colors.deepOrange,
                          questionTag: "Question:$index",
                          tagColor: Colors.black,
                          answerColor: Colors.white,
                          answerBackgroundColor:
                              Color.fromARGB(255, 255, 0, 111),
                          questionColor: Colors.black,
                          width: 300,
                          height: 500,
                          question: "${data['Q${index}']['question']}",
                          rightAnswer: "${data['Q$index']['answers'][0]}",
                          wrongAnswers: [
                            "${data['Q$index']['answers'][1]}",
                            "${data['Q$index']['answers'][2]}",
                            "${data['Q$index']['answers'][3]}",
                          ],
                          onRightAnswer: () {
                            score += 1;
                            total += 1;
                            print(score);
                          },
                          onWrongAnswer: () {
                            random_number = Random().nextInt(10);
                            total += 1;
                          },
                        ),
                      );
                    },
                  );
                }

                return Text("loading");
              },
            ),
          )
        ],
      ),
      bottomNavigationBar: BottomAppBar(
          child: Container(
        height: 60,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              primary: Color.fromARGB(255, 156, 203, 247),
              side: BorderSide(color: Colors.black)),
          onPressed: () {
            _page.nextPage(
                duration: Duration(microseconds: 1), curve: Curves.bounceIn);

            if (total > 9) {
              _count.onPause;
              Navigator.push(context,
                  MaterialPageRoute(builder: (BuildContext context) {
                return result(score);
              }));
            } else {
              total += 1;
              _count.restart();
            }
          },
          child: Text("NEXT"),
        ),
      )),
    );
  }
}
