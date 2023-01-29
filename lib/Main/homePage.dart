import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import '../models/achive_modle.dart';

class homey extends StatelessWidget {
  final String? name;
  const homey(this.name, {super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          HeaderWithWelcom(size, context),
          TitleWithLine(text: 'Your Progress'),
          Padding(
            padding: const EdgeInsets.only(top: 20.0, bottom: 40.0),
            child: CircularPercentIndicator(
              animation: true,
              animationDuration: 1000,
              radius: 131,
              lineWidth: 40,
              percent: 0.3,
              progressColor: Color.fromARGB(255, 165, 101, 234),
              backgroundColor: Color.fromARGB(255, 202, 187, 226),
              circularStrokeCap: CircularStrokeCap.round,
              center: Text(
                '30%',
                style: TextStyle(fontSize: 55, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          // TitleWithLine(text: 'You ach'),
          // Padding(
          //   padding: const EdgeInsets.only(top: 20.0, bottom: 90.0),
          //   child: Expanded(
          //     child: Padding(
          //       padding: const EdgeInsets.symmetric(horizontal: 20.0),
          //       child: GridView.builder(
          //           itemCount: achieveList.length,
          //           gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          //             crossAxisCount: 2,
          //             mainAxisSpacing: 20.0,
          //             childAspectRatio: 0.75,
          //           ),
          //           itemBuilder: ((context, index) =>
          //               achiCard(achi: achieveList[index]))),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }

  Container HeaderWithWelcom(Size size, BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        bottom: 20.0 * 2.5,
      ),
      padding: EdgeInsets.only(left: 20.0, right: 20.0),
      height: size.height * 0.33,
      decoration: BoxDecoration(
        color: Color(0xFF8EA3E2),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(39),
          bottomRight: Radius.circular(39),
        ),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 10),
            blurRadius: 50,
            color: Color(0xFF8EA3E2).withOpacity(0.75),
          )
        ],
      ),
      child: Row(
        children: <Widget>[
          Text(
            'Hi $name',
            style: Theme.of(context)
                .textTheme
                .headline4
                ?.copyWith(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          Spacer(),
          Image.asset(
            'images/logo2.png',
            width: size.width * 0.3,
          ),
        ],
      ),
    );
  }
}

// class achiCard extends StatelessWidget {
//   final achieve achi;
//   const achiCard({
//     Key? key,
//     required this.achi,
//   }) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: <Widget>[
//         Container(
//           padding: EdgeInsets.all(20.0),
//           // height: 180,
//           // width: 160,
//           decoration: BoxDecoration(
//             color: Colors.purple.shade200,
//             borderRadius: BorderRadius.circular(16),
//           ),
//           child: Image.asset(achieveList[0].image),
//         ),
//         Padding(
//           padding: const EdgeInsets.symmetric(vertical: 4.0),
//           child: Text(
//             achieveList[0].name,
//             style: TextStyle(color: Colors.black38),
//           ),
//         ),
//         Text(
//           achieveList[0].detail,
//           style: TextStyle(fontWeight: FontWeight.bold),
//         ),
//       ],
//     );
//   }
// }

class TitleWithLine extends StatelessWidget {
  const TitleWithLine({
    Key? key,
    required this.text,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 29,
      child: Stack(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 4.0),
            child: Text(
              text,
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              margin: EdgeInsets.only(right: 4.0),
              height: 7,
              color: Color.fromARGB(255, 61, 7, 255).withOpacity(0.25),
            ),
          )
        ],
      ),
    );
  }
}
