import 'package:alqgp/Lessons/lesson.dart';
import 'package:alqgp/Quizes/quiz.dart';
import 'package:alqgp/models/user_model.dart';
import 'package:flutter/material.dart';
import '../AR/AR.dart';
import '../models/chapter_model.dart';

class chapCont extends StatelessWidget {
  final Chapter chapter;
  final UserModel loggedInUser;
  const chapCont(
      {super.key, required this.chapter, required this.loggedInUser});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        // title: Text(
        //   'Learning',
        //   style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        // ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
      ),
      body: Body(
        chap: chapter,
        loggedInUser: loggedInUser,
      ),
    );
  }
}

class Body extends StatelessWidget {
  final Chapter chap;
  final UserModel loggedInUser;
  const Body({
    Key? key,
    required this.chap,
    required this.loggedInUser,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          ImageAndIcons(
            size: size,
            chap: chap,
            loggedInUser: loggedInUser,
          ),
          Title(
            title: chap.chapterName,
            //photo: "${chap.itemImage}",
          ),
          //SizedBox(height: 20.0),
          // Row(
          //   children: <Widget>[
          //     // SizedBox(
          //     //   width: size.width / 2,
          //     //   height: 84,
          //     //   child: TextButton(
          //     //     // shape: RoundedRectangleBorder(
          //     //     //   borderRadius: BorderRadius.only(
          //     //     //     topRight: Radius.circular(20),
          //     //     //   ),
          //     //     // ),
          //     //     // color: Colors.amber,
          //     //     onPressed: () {},
          //     //     child: Text(
          //     //       "Buy Now",
          //     //       style: TextStyle(
          //     //         color: Color.fromARGB(255, 165, 16, 16),
          //     //         fontSize: 16,
          //     //       ),
          //     //     ),
          //     //   ),
          //     // ),
          //     Expanded(
          //       child: TextButton(
          //         onPressed: () {
          //           Navigator.of(context).push(MaterialPageRoute(
          //               builder: (context) => quiz_page(
          //                     chap: chap.chapNum,
          //                   )));
          //         },
          //         child: const Text("Quiz"),
          //       ),
          //     ),
          //   ],
          // ),
        ],
      ),
    );
  }
}

class ImageAndIcons extends StatelessWidget {
  const ImageAndIcons(
      {Key? key,
      required this.size,
      required this.chap,
      required this.loggedInUser})
      : super(key: key);

  final Size size;
  final Chapter chap;
  final UserModel loggedInUser;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0 * 3),
      child: SizedBox(
        height: size.height * 0.7,
        child: Row(
          children: <Widget>[
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0 * 3),
                child: Column(
                  children: <Widget>[
                    // Align(
                    //   alignment: Alignment.topLeft,
                    //   child: IconButton(
                    //     padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    //     icon: const Icon(Icons.arrow_back_rounded),
                    //     onPressed: () {
                    //       Navigator.pop(context);
                    //     },
                    //   ),
                    // ),
                    //Spacer(),
                    SizedBox(
                      height: size.height * 0.02,
                    ),

                    IconCard(
                        icon: "images/icons8-elearning-64.png",
                        page: lessons(
                          chap: chap,
                          loggedInUser: loggedInUser,
                        )),
                    IconCard(
                        icon: "images/icons8-ar-100 (1).png",
                        page: AR(
                          chaptNum: chap.chapNum,
                        )),
                    // IconCard(
                    //   icon: "images/icons8-marker-100 (2).png",
                    //   page: quiz_page(chap: chap.chapNum),
                    // ),
                    //IconCard(icon: "images/rating.png"),
                  ],
                ),
              ),
            ),
            Container(
              height: size.height * 0.8,
              width: size.width * 0.70,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(63),
                  bottomLeft: Radius.circular(63),
                ),
                boxShadow: [
                  BoxShadow(
                    offset: const Offset(0, 10),
                    blurRadius: 60,
                    color: Colors.amber.withOpacity(0.29),
                  ),
                ],
                image: DecorationImage(
                  alignment: Alignment.centerLeft,
                  fit: BoxFit.contain,
                  image: AssetImage(chap.photo),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class IconCard extends StatelessWidget {
  const IconCard({
    Key? key,
    required this.icon,
    required this.page,
  }) : super(key: key);

  final String icon;
  final dynamic page;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => page));
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: size.height * 0.03),
        padding: const EdgeInsets.all(20.0 / 2),
        height: 65,
        width: 65,
        decoration: BoxDecoration(
          color: Colors.purple.shade200,
          borderRadius: BorderRadius.circular(6),
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, 15),
              blurRadius: 22,
              color: Colors.purple.withOpacity(0.22),
            ),
            const BoxShadow(
              offset: Offset(-15, -15),
              blurRadius: 20,
              color: Colors.white,
            ),
          ],
        ),
        child: Image.asset(icon),
      ),
    );
  }
}

class Title extends StatelessWidget {
  const Title({
    Key? key,
    required this.title,
    // required this.photo,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        children: <Widget>[
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: "$title\n",
                  style: Theme.of(context).textTheme.headline4?.copyWith(
                      color: Colors.amber, fontWeight: FontWeight.bold),
                ),
                // TextSpan(
                //   text: country,
                //   style: TextStyle(
                //     fontSize: 20,
                //     color: Colors.purple,
                //     fontWeight: FontWeight.w300,
                //   ),
                // ),
              ],
            ),
          ),
          const Spacer(),
          // Text(
          //   "\$$price",
          //   style: Theme.of(context)
          //       .textTheme
          //       .headline5
          //       ?.copyWith(color: Colors.purple),
          // )
        ],
      ),
    );
  }
}


// import 'package:alqgp/Lessons/lesson.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import '../AR/AR.dart';
// import '../Lessons/summary.dart';
// import '../models/chapter_model.dart';
// class chapCont extends StatelessWidget {
//   final Chapter chapter;
//   const chapCont({super.key, required this.chapter});
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // appBar: AppBar(
//       //   elevation: 0,
//       //   // title: Text(
//       //   //   'Learning',
//       //   //   style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
//       //   // ),
//       //   centerTitle: true,
//       //   backgroundColor: Colors.transparent,
//       // ),
//       body: Body(
//         chap: chapter,
//       ),
//     );
//   }
// }
// class Body extends StatelessWidget {
//   final Chapter chap;
//   const Body({
//     Key? key,
//     required this.chap,
//   }) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     return SingleChildScrollView(
//       child: Column(
//         children: <Widget>[
//           ImageAndIcons(
//             size: size,
//             photo: chap.photo,
//           ),
//           TitleAndPrice(
//             title: chap.chapterName,
//             //photo: "${chap.itemImage}",
//           ),
//           //SizedBox(height: 20.0),
//         //   Row(
//         //     children: <Widget>[
//         //       // SizedBox(
//         //       //   width: size.width / 2,
//         //       //   height: 84,
//         //       //   child: TextButton(
//         //       //     // shape: RoundedRectangleBorder(
//         //       //     //   borderRadius: BorderRadius.only(
//         //       //     //     topRight: Radius.circular(20),
//         //       //     //   ),
//         //       //     // ),
//         //       //     // color: Colors.amber,
//         //       //     onPressed: () {},
//         //       //     child: Text(
//         //       //       "Buy Now",
//         //       //       style: TextStyle(
//         //       //         color: Color.fromARGB(255, 165, 16, 16),
//         //       //         fontSize: 16,
//         //       //       ),
//         //       //     ),
//         //       //   ),
//         //       // ),
//         //       // Expanded(
//         //       //   child: TextButton(
//         //       //     onPressed: () {},
//         //       //     child: const Text("Quiz"),
//         //       //   ),
//         //       // ),
//         //     ],
//         //   ),
//         // ],
//       ),
//     );
//   }
// }
// class ImageAndIcons extends StatelessWidget {
//   const ImageAndIcons({
//     Key? key,
//     required this.size,
//     required this.photo,
//   }) : super(key: key);
//   final Size size;
//   final String photo;
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.only(bottom: 10.0 * 3),
//       child: SizedBox(
//         height: size.height * 0.8,
//         child: Row(
//           children: <Widget>[
//             Expanded(
//               child: Padding(
//                 padding: const EdgeInsets.symmetric(vertical: 20.0 * 3),
//                 child: Column(
//                   children: <Widget>[
//                     Align(
//                       alignment: Alignment.topLeft,
//                       child: IconButton(
//                         padding: const EdgeInsets.symmetric(horizontal: 20.0),
//                         icon: const Icon(Icons.arrow_back_rounded),
//                         onPressed: () {
//                           Navigator.pop(context);
//                         },
//                       ),
//                     ),
//                     //Spacer(),
//                     const SizedBox(
//                       height: 71,
//                     ),
//                     const IconCard(
//                         icon: "images/icons8-ar-100 (1).png", page: AR()),
//                     const IconCard(
//                         icon: "images/icons8-elearning-64.png", page: summary()
//                         //lessons()
//                         ),
//                     const IconCard(
//                       icon: "images/icons8-marker-100 (2).png",
//                       page: summary(),
//                     ),
//                     //IconCard(icon: "images/rating.png"),
//                   ],
//                 ),
//               ),
//             ),
//             Container(
//               height: size.height * 0.8,
//               width: size.width * 0.70,
//               decoration: BoxDecoration(
//                 borderRadius: const BorderRadius.only(
//                   topLeft: Radius.circular(63),
//                   bottomLeft: Radius.circular(63),
//                 ),
//                 boxShadow: [
//                   BoxShadow(
//                     offset: const Offset(0, 10),
//                     blurRadius: 60,
//                     color: const Color.fromARGB(255, 79, 178, 249)
//                         .withOpacity(0.29),
//                   ),
//                 ],
//                 image: DecorationImage(
//                   alignment: Alignment.centerLeft,
//                   fit: BoxFit.contain,
//                   image: AssetImage(photo),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
// class IconCard extends StatelessWidget {
//   const IconCard({
//     Key? key,
//     required this.icon,
//     required this.page,
//   }) : super(key: key);
//   final String icon;
//   final dynamic page;
//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     return GestureDetector(
//       onTap: () {
//        Nav igator.of(context)
//             .push(MaterialPageRoute(builder: (context) => page));
//       },
//       child: Container(
//         margin: EdgeInsets.symmetric(vertical: size.height * 0.03),
//         padding: const EdgeInsets.all(20.0 / 2),
//         height: 65,
//         width: 65,
//         decoration: BoxDecoration(
//           color: Colors.purple.shade200,
//           borderRadius: BorderRadius.circular(6),
//           boxShadow: [
//             BoxShadow(
//               offset: const Offset(0, 15),
//               blurRadius: 22,
//               color: Colors.purple.withOpacity(0.22),
//             ),
//             const BoxShadow(
//               offset: Offset(-15, -15),
//               blurRadius: 20,
//               color: Colors.white,
//             ),
//           ],
//         ),
//         child: Image.asset(icon),
//       ),
//     );
//   }
// }
// class TitleAndPrice extends StatelessWidget {
//   const TitleAndPrice({
//     Key? key,
//     required this.title,
//     // required this.photo,
//   }) : super(key: key);
//   final String title;
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 20.0),
//       child: Row(
//         children: <Widget>[
//           RichText(
//             text: TextSpan(
//               children: [
//                 TextSpan(
//                   text: "$title\n",
//                   style: Theme.of(context).textTheme.headline4?.copyWith(
//                       color: Colors.amber, fontWeight: FontWeight.bold),
//                 ),
//                 // TextSpan(
//                 //   text: country,
//                 //   style: TextStyle(
//                 //     fontSize: 20,
//                 //     color: Colors.purple,
//                 //     fontWeight: FontWeight.w300,
//                 //   ),
//                 // ),
//               ],
//             ),
//           ),
//           const Spacer(),
//           // Text(
//           //   "\$$price",
//           //   style: Theme.of(context)
//           //       .textTheme
//           //       .headline5
//           //       ?.copyWith(color: Colors.purple),
//           // )
//         ],
//       ),
//     );
//   }
// }