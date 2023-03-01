import 'package:alqgp/Services/database.dart';
import 'package:alqgp/Src/Utils/Consts/consts.dart';
import 'package:alqgp/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class homey extends StatelessWidget {
  UserModel loggedInUser;
  homey(this.loggedInUser, {super.key});

  late Stream<UserModel?> userData = getUserData(loggedInUser.uid);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final _currentIndex = PageController();
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          HeaderWithWelcom(size, context),
          const SizedBox(height: 50),
          Container(
            height: 300,
            child: PageView.builder(
              scrollDirection: Axis.horizontal,
              controller: _currentIndex,
              itemCount: 2,
              itemBuilder: (context, index) {
                return progressCard(index, size, context);
              },
            ),
          ),
          SmoothPageIndicator(
            controller: _currentIndex,
            count: 2,
            effect: const WormEffect(activeDotColor: kTextColor),
          )
        ],
      ),
    );
  }

  HeaderWithWelcom(Size size, BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20.0 * 2.5),
      padding: const EdgeInsets.only(left: 20.0, right: 20.0),
      height: size.height * 0.33,
      decoration: BoxDecoration(
        color: Color(0xFF8EA3E2),
        borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(39), bottomRight: Radius.circular(39)),
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 10),
            blurRadius: 50,
            color: Color(0xFF8EA3E2).withOpacity(0.75),
          )
        ],
      ),
      child: StreamBuilder<UserModel?>(
        stream: userData,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Text('Somthing went wrong ☹');
          } else if (snapshot.hasData) {
            loggedInUser = snapshot.data!;
            return Row(
              children: <Widget>[
                Text(
                  'Hi ${loggedInUser.firstName}',
                  style: Theme.of(context).textTheme.headline4?.copyWith(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                Image.asset(
                  'images/logo6.png',
                  width: size.width * 0.3,
                ),
              ],
            );
          } else {
            return const Center(child: Text(''));
          }
        },
      ),
    );
  }

  Column progressCard(int index, Size size, BuildContext context) {
    if (index == 0) {
      return Column(
        children: [
          const TitleWithLine(text: 'Your Progress'),
          const SizedBox(height: 30),
          bar(
              size,
              context,
              loggedInUser.ch1! / 5 >= 5 ? 1.0 : loggedInUser.ch1! / 5,
              Colors.amber),
          bar(
              size,
              context,
              0.5,
              // loggedInUser.ch2! / 7 >= 7 ? 1.0 : loggedInUser.ch2! / 7,
              Colors.red),
          bar(
              size,
              context,
              // loggedInUser.ch3! / 6 >= 6 ? 1.0 : loggedInUser.ch3! / 6,
              0.7,
              Colors.blue),
          bar(
              size,
              context,
              // loggedInUser.ch4! / 4 >= 4 ? 1.0 : loggedInUser.ch4! / 4,
              0.3,
              Colors.green),
          bar(
              size,
              context,
              // loggedInUser.ch5! / 4 >= 4 ? 1.0 : loggedInUser.ch5! / 4,
              0.26,
              Colors.pink),
        ],
      );
    } else {
      return Column(
        children: [
          const TitleWithLine(text: 'The top 5'),
          const SizedBox(height: 30),
          top_bar(size, context, 0.6, Colors.amber),
          top_bar(size, context, 0.9, Colors.green),
          top_bar(size, context, 0.2, Colors.pink),
        ],
      );
    }
  }

  Padding top_bar(
      Size size, BuildContext context, double percent, MaterialColor color) {
    return Padding(
      padding: const EdgeInsets.only(
          top: 10.0, bottom: 10.0, left: 20.0, right: 20.0),
      child: LinearPercentIndicator(
        leading: Icon(Icons.person),
        trailing: Text('${percent * 100}%'),
        barRadius: Radius.circular(20.0),
        animation: true,
        animationDuration: 1000,
        lineHeight: 10,
        percent: percent,
        progressColor: color,
        backgroundColor: color.shade200,
      ),
    );
  }
}

Padding bar(
    Size size, BuildContext context, double percent, MaterialColor color) {
  return Padding(
    padding:
        const EdgeInsets.only(top: 10.0, bottom: 10.0, left: 20.0, right: 20.0),
    child: LinearPercentIndicator(
      leading: Icon(Icons.auto_stories_rounded),
      trailing: Text('${percent * 100}%'),
      barRadius: Radius.circular(20.0),
      animation: true,
      animationDuration: 1000,
      lineHeight: 10,
      percent: percent,
      progressColor: color,
      backgroundColor: color.shade200,
    ),
  );
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
