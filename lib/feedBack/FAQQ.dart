import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import '../models/achive_modle.dart';
import 'package:alqgp/Settings/settings.dart';

class FAQQ extends StatefulWidget {
  static const String screenRout = 'FAQ';
  const FAQQ( {Key? key}) : super(key: key);
  @override
  _faqq createState() => _faqq();
}

class _faqq extends State<FAQQ> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "FAQ",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Column(
              children: [
                // Container(
                //   height: 180,
                //   child: Image.asset('images/logo4.png'),
                // ),
                // const Text(
                //   'عَــلَــــق ',
                //   style: TextStyle(
                //     fontSize: 40,
                //     fontWeight: FontWeight.w900,
                //     color:Color(0xFF8EA3E2),
                //   ),
                // ),
                const SizedBox(height: 48),
                buildAbout(),
                buildAbout2(),
              ],
            ),
          ],
        ),
      ),
    );
  }
  
  Widget buildAbout() => Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Frequently asked questions',
              style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold,color:Colors.pink.shade200),
            ),
            const SizedBox(height: 35,),
            // Text(
            //   "",
            //   style: TextStyle(fontSize: 16, height: 1.4,fontWeight: FontWeight.bold,color:Color(0xFF8EA3E2).withOpacity(0.75),),
            // ),
          ], 
        ),
      );

    Widget buildAbout2() => Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  color:Color.fromARGB(94, 244, 143, 177),
                  borderRadius: BorderRadius.all(
                    Radius.circular(12.0),
                  ),
                ),
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                child:Column (
                  children: [
                    Text(
                      'Can I start with any chapter I want?',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color:Color(0xFF8EA3E2).withOpacity(0.75),),
                    ),
                    const SizedBox(height: 5,),
                    Text(
                      "Yes, after logging in, you can go to the learning page where the human body systems chapters will appear, and the user can choose the chapter he wants.",
                      style: TextStyle(fontSize: 16, height: 1.4,fontWeight: FontWeight.bold,color:Colors.white,),
                    ), 
                  ],
                ),
              ),
            ],
          ),
          Column(
            children: [
              const SizedBox(height: 25,),
              Container(
                decoration: BoxDecoration(
                  color:Color.fromARGB(94, 244, 143, 177),
                  borderRadius: BorderRadius.all(
                    Radius.circular(12.0),
                  ),
                ),
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                child:Column (
                  children: [
                    Text(
                      "When can I take the chapter's quiz ?",
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color:Color(0xFF8EA3E2).withOpacity(0.75),),
                    ),
                    const SizedBox(height: 5,),
                    Text(
                      "You can take the chapter's quiz after learning all the content of the class: taking lessons, seeing a 3D model, and viewing augmented reality.",
                      style: TextStyle(fontSize: 16, height: 1.4,fontWeight: FontWeight.bold,color:Colors.white,),
                    ), 
                  ],
                ),
              ),
            ],
          ),
          Column(
            children: [
              const SizedBox(height: 25,),
              Container(
                decoration: BoxDecoration(
                  color:Color.fromARGB(94, 244, 143, 177),
                  borderRadius: BorderRadius.all(
                    Radius.circular(12.0),
                  ),
                ),
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                child:Column (
                  children: [
                    Text(
                      'Can I take the quiz again?',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color:Color(0xFF8EA3E2).withOpacity(0.75),),
                    ),
                    const SizedBox(height: 5,),
                    Text(
                      "Yes, you can learn the chapter over and over again, and you can also learn the lessons and see a 3D model and an augmented reality view again.",
                      style: TextStyle(fontSize: 16, height: 1.4,fontWeight: FontWeight.bold,color:Colors.white,),
                    ), 
                  ],
                ),
              ),
            ],
          ),
          Column(
            children: [
              const SizedBox(height: 25,),
              Container(
                decoration: BoxDecoration(
                  color:Color.fromARGB(94, 244, 143, 177),
                  borderRadius: BorderRadius.all(
                    Radius.circular(12.0),
                  ),
                ),
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                child:Column (
                  children: [
                    Text(
                      'If I delete the account, can I get it back?',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color:Color(0xFF8EA3E2).withOpacity(0.75),),
                    ),
                    const SizedBox(height: 5,),
                    Text(
                      "Unfortunately, if you delete the account, all information related to it will be erased from our servers.",
                      style: TextStyle(fontSize: 16, height: 1.4,fontWeight: FontWeight.bold,color:Colors.white,),
                    ), 
                  ],
                ),
              ),
            ],
          ),
          Column(
            children: [
              const SizedBox(height: 25,),
              Container(
                decoration: BoxDecoration(
                  color:Color.fromARGB(94, 244, 143, 177),
                  borderRadius: BorderRadius.all(
                    Radius.circular(12.0),
                  ),
                ),
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                child:Column (
                  children: [
                    Text(
                      'If I delete the account, can I register again with the same email of the deleted account?',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color:Color(0xFF8EA3E2).withOpacity(0.75),),
                    ),
                    const SizedBox(height: 5,),
                    Text(
                      "Yes, you can .",
                      style: TextStyle(fontSize: 16, height: 1.4,fontWeight: FontWeight.bold,color:Colors.white,),
                    ), 
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
}

