import 'package:flutter/material.dart';
import 'package:alqgp/screens/chapters.dart';
import 'package:alqgp/screens/body.dart';

class chapterContent extends StatefulWidget {
  const chapterContent({super.key});

  @override
  State<chapterContent> createState() => chaptersContent();
}

class chaptersContent extends State<chapterContent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("images/backgraund4.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Body2(),
        ],
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: Color.fromARGB(255, 196, 93, 83),
      elevation: 0,
      leading: IconButton(
        icon: Image.asset("images/backArrow3.png"),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const header()),
          );
        },
      ),
      title: Center(
        child: Text(
          "ALQ",
          style: TextStyle(
            fontSize: 23,
            color: Colors.black,
          ),
        ),
      ),
      actions: <Widget>[
        IconButton(
          icon: Image.asset('images/profile2.png'),
          onPressed: () => null, //go to profile page
        ),
      ],
    );
  }
}
//chpters
