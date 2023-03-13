// import 'package:alqgp/Ptofile/chart.dart';
// import 'package:alqgp/Services/database.dart';
// import 'package:alqgp/User/edit.dart';
// import 'package:flutter/material.dart';
// import 'package:percent_indicator/circular_percent_indicator.dart';
// import '../models/user_model.dart';
// import '../widgets/App_Bar.dart';
// import '../widgets/profile_widget.dart';
// import 'edit_profile.dart';

// class profile extends StatefulWidget {
//   profile({super.key, required this.user});

//   UserModel user;

//   @override
//   State<profile> createState() => _profileState();
// }

// class _profileState extends State<profile> {
//   // User? user = FirebaseAuth.instance.currentUser;
//   // UserModel loggedInUser = UserModel();

//   // _profileState(UserModel user) {
//   //   loggedInUser = user;
//   // }
//   late Stream<UserModel?> userData = getUserData(widget.user.uid);

//   @override
//   Widget build(BuildContext context) {
//     return StreamBuilder<UserModel?>(
//         stream: userData,
//         builder: (context, snapshot) {
//           if (snapshot.hasError) {
//             return Text('Somthing went wrong ☹');
//           } else if (snapshot.hasData) {
//             widget.user = snapshot.data!;
//             return Scaffold(
//               appBar: buildAppBar(context, 'Profile'),
//               body: ListView(
//                 physics: BouncingScrollPhysics(),
//                 children: [
//                   ProfileWidget(
//                     imagePath:
//                         'https://images.unsplash.com/photo-1554151228-14d9def656e4?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=333&q=80', //user.imagePath
//                     onClicked: () {
//                       Navigator.push(context, MaterialPageRoute(
//                         builder: (context) {
//                           return EditProfile(
//                             currentUser: widget.user,
//                             onLoad: () {
//                               setState(() {});
//                             },
//                           );
//                         },
//                       ));
//                     },
//                   ),
//                   const SizedBox(height: 24),
//                   buildName(widget.user),
//                   const SizedBox(height: 50),
//                   Container(
//                     child: Padding(
//                       padding: const EdgeInsets.only(top: 20.0, bottom: 40.0),
//                       child: CircularPercentIndicator(
//                         animation: true,
//                         animationDuration: 1000,
//                         radius: 131,
//                         lineWidth: 40,
//                         percent: widget.user.score! / 100 * 50,
//                         progressColor: Color.fromARGB(255, 165, 101, 234),
//                         backgroundColor: Color.fromARGB(255, 202, 187, 226),
//                         circularStrokeCap: CircularStrokeCap.round,
//                         center: Text(
//                           '${widget.user.score! / 100 * 50}%',
//                           style: TextStyle(
//                               fontSize: 55, fontWeight: FontWeight.bold),
//                         ),
//                       ),
//                     ),
//                   ),
//                   const SizedBox(height: 50),
//                   Container(
//                     transform: Matrix4.translationValues(0.0, -60, 0.0),
//                     child: MyLineChart(),
//                   )
//                 ],
//               ),
//             );
//           } else {
//             return Center(child: CircularProgressIndicator());
//           }
//         }
//         //   ),
//         );
//   }

//   Widget buildName(UserModel user) => Column(
//         children: [
//           Text(
//             //user.name,
//             '${widget.user.firstName} ${widget.user.secondName}',
//             style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
//           ),
//           const SizedBox(height: 4),
//           Text(
//             //user.email,
//             '${widget.user.email}',
//             style: TextStyle(color: Colors.grey),
//           )
//         ],
//       );

//   // Widget buildUpgradeButton() => ButtonWidget(
//   //       text: 'Upgrade To PRO',
//   //       onClicked: () {},
//   //     );

//   // Widget buildAbout(User user) => Container(
//   //       padding: EdgeInsets.symmetric(horizontal: 48),
//   //       child: Column(
//   //         crossAxisAlignment: CrossAxisAlignment.start,
//   //         children: [
//   //           Text(
//   //             'About',
//   //             style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//   //           ),
//   //           const SizedBox(height: 16),
//   //           Text(
//   //             user.about,
//   //             style: TextStyle(fontSize: 16, height: 1.4),
//   //           ),
//   //         ],
//   //       ),
//   //     );
// }
//         //   appBar: AppBar(
//         //     backgroundColor: Colors.white,
//         //     elevation: 0.0,
//         //     actions: [
//         //       CircleAvatar(
//         //         radius: 20.0,
//         //         child: ClipOval(
//         //           child: Image.asset('images/profile2.png', fit: BoxFit.cover),
//         //         ),
//         //       ),
//         //       SizedBox(
//         //         width: 20,
//         //       )
//         //     ],
//         //   ),
//         //   body: Container(
//         //     color: Colors.white,
//         //     child: ListView(
//         //       children: [
//         //         Container(
//         //           padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//         //           child: Column(
//         //             crossAxisAlignment: CrossAxisAlignment.start,
//         //             children: [
//         //               Text("Today"),
//         //               Text(
//         //                 "February 07, 2021",
//         //                 style: TextStyle(
//         //                     color: Colors.black, fontWeight: FontWeight.bold),
//         //               ),
//         //             ],
//         //           ),
//         //         ),
//         //         Container(
//         //           padding: EdgeInsets.symmetric(horizontal: 20),
//         //           child: Row(
//         //             children: [
//         //               Expanded(
//         //                 child: Column(
//         //                   children: [
//         //                     Container(
//         //                       padding: EdgeInsets.all(6),
//         //                       decoration: BoxDecoration(
//         //                           shape: BoxShape.circle, color: Colors.deepOrange),
//         //                       child: Icon(
//         //                         Icons.favorite_border,
//         //                         color: Colors.white,
//         //                       ),
//         //                     ),
//         //                     SizedBox(
//         //                       height: 10,
//         //                     ),
//         //                     Text(
//         //                       "Heart",
//         //                       style: TextStyle(fontSize: 16.0),
//         //                     ),
//         //                     Text(
//         //                       "80",
//         //                       style: TextStyle(fontSize: 20),
//         //                     ),
//         //                     Text(
//         //                       "Per min",
//         //                       style: TextStyle(fontSize: 12.0),
//         //                     )
//         //                   ],
//         //                 ),
//         //               ),
//         //               Expanded(
//         //                 child: Container(
//         //                   padding: EdgeInsets.symmetric(vertical: 20),
//         //                   decoration: BoxDecoration(
//         //                     border: Border.all(color: kDefaultIconDarkColor),
//         //                     borderRadius: BorderRadius.all(Radius.circular(30)),
//         //                   ),
//         //                   child: Column(
//         //                     children: [
//         //                       Container(
//         //                         padding: EdgeInsets.all(6),
//         //                         decoration: BoxDecoration(
//         //                             shape: BoxShape.circle,
//         //                             color: kDefaultIconDarkColor),
//         //                         child: Icon(
//         //                           Icons.local_fire_department_sharp,
//         //                           color: Colors.white,
//         //                         ),
//         //                       ),
//         //                       SizedBox(
//         //                         height: 10,
//         //                       ),
//         //                       Text(
//         //                         "Calories",
//         //                         style: TextStyle(fontSize: 16.0),
//         //                       ),
//         //                       Text(
//         //                         "950",
//         //                         style: TextStyle(fontSize: 20),
//         //                       ),
//         //                       Text(
//         //                         "Kcal",
//         //                         style: TextStyle(fontSize: 12.0),
//         //                       )
//         //                     ],
//         //                   ),
//         //                 ),
//         //               ),
//         //               Expanded(
//         //                 child: Column(
//         //                   children: [
//         //                     Container(
//         //                       padding: EdgeInsets.all(6),
//         //                       decoration: BoxDecoration(
//         //                           shape: BoxShape.circle,
//         //                           color: Colors.orangeAccent),
//         //                       child: Icon(
//         //                         Icons.nightlight_round,
//         //                         color: Colors.white,
//         //                       ),
//         //                     ),
//         //                     SizedBox(
//         //                       height: 10,
//         //                     ),
//         //                     Text(
//         //                       "Sleep",
//         //                       style: TextStyle(fontSize: 16.0),
//         //                     ),
//         //                     Text(
//         //                       "8:30",
//         //                       style: TextStyle(fontSize: 20),
//         //                     ),
//         //                     Text(
//         //                       "Hours",
//         //                       style: TextStyle(fontSize: 12.0),
//         //                     )
//         //                   ],
//         //                 ),
//         //               ),
//         //               Expanded(
//         //                 child: Column(
//         //                   children: [
//         //                     Container(
//         //                       padding: EdgeInsets.all(6),
//         //                       decoration: BoxDecoration(
//         //                           shape: BoxShape.circle, color: Colors.deepPurple),
//         //                       child: Icon(
//         //                         Icons.timer_sharp,
//         //                         color: Colors.white,
//         //                       ),
//         //                     ),
//         //                     SizedBox(
//         //                       height: 10,
//         //                     ),
//         //                     Text(
//         //                       "Training",
//         //                       style: TextStyle(fontSize: 16.0),
//         //                     ),
//         //                     Text(
//         //                       "2:00",
//         //                       style: TextStyle(fontSize: 20),
//         //                     ),
//         //                     Text(
//         //                       "Hours",
//         //                       style: TextStyle(fontSize: 12.0),
//         //                     )
//         //                   ],
//         //                 ),
//         //               ),
//         //             ],
//         //           ),
//         //         ),
//         //         SizedBox(
//         //           height: 30,
//         //         ),
//         //         // Container(
//         //         //   height: 200,
//         //         //   width: 200,
//         //         //   child: SfRadialGauge(
//         //         //     axes: <RadialAxis>[
//         //         //       RadialAxis(
//         //         //         axisLineStyle: AxisLineStyle(
//         //         //             thickness: 0.2,
//         //         //             thicknessUnit: GaugeSizeUnit.factor,
//         //         //             cornerStyle: CornerStyle.bothCurve),
//         //         //         showTicks: false,
//         //         //         showLabels: false,
//         //         //         onAxisTapped: (value) {},
//         //         //         pointers: <GaugePointer>[
//         //         //           RangePointer(
//         //         //               color: MyColor.secondary,
//         //         //               value: 60,
//         //         //               onValueChanged: (value) {},
//         //         //               cornerStyle: CornerStyle.bothCurve,
//         //         //               onValueChangeEnd: (value) {},
//         //         //               onValueChanging: (value) {},
//         //         //               enableDragging: true,
//         //         //               width: 0.2,
//         //         //               sizeUnit: GaugeSizeUnit.factor)
//         //         //         ],
//         //         //         annotations: <GaugeAnnotation>[
//         //         //           GaugeAnnotation(
//         //         //             widget: Column(
//         //         //               mainAxisAlignment: MainAxisAlignment.center,
//         //         //               children: [
//         //         //                 Text(
//         //         //                   "2.0",
//         //         //                   style: TextStyle(
//         //         //                       fontSize: 25, fontWeight: FontWeight.bold),
//         //         //                 ),
//         //         //                 Text(
//         //         //                   "KM",
//         //         //                   style: TextStyle(
//         //         //                     fontSize: 14,
//         //         //                   ),
//         //         //                 ),
//         //         //               ],
//         //         //             ),
//         //         //             positionFactor: 0.13,
//         //         //             angle: 0.5,
//         //         //           )
//         //         //         ],
//         //         //       ),
//         //         //     ],
//         //         //   ),
//         //         // ),
//         //         Container(
//         //           height: 100,
//         //         ),

//         //         //here is the chart
//         //         //lets make new statefull widget
//         //         //now lets move chart a little bit

//         //         //we are done.
//         //         //thanks for watching :)

//         //         Container(
//         //           transform: Matrix4.translationValues(0.0, -60, 0.0),
//         //           child: MyLineChart(),
//         //         )
//         //       ],
//         //     ),
//         //   ),
//         //   floatingActionButton: FloatingActionButton(
//         //     backgroundColor: kDefaultIconDarkColor,
//         //     onPressed: () {},
//         //     child: Icon(
//         //       Icons.add,
//         //       color: Colors.white,
//         //     ),
//         //   ),
//         //   floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
// //         );
// //   }
// // }




// // class ProfileScreen extends StatefulWidget {
// //   @override
// //   State<ProfileScreen> createState() => _ProfileScreenState();
// // }

// // class _ProfileScreenState extends State<ProfileScreen> {
// //   User? user = FirebaseAuth.instance.currentUser;
// //   UserModel loggedInUser = UserModel();

// //   @override
// //   void initState() {
// //     super.initState();
// //     FirebaseFirestore.instance
// //         .collection("student")
// //         .doc(user!.uid)
// //         .get()
// //         .then((value) {
// //       loggedInUser = UserModel.fromMap(value.data());
// //       setState(() {});
// //     });
// //   }

// //   /* String? name = '';
// //   String? email = '';
// //   String? image = '';
// //   int score = 0;
// //   File? imageFile;

// //   Future _getDataFromDatabase() async {
// //     await FirebaseFirestore.instance
// //         .collection("student")
// //         .doc(FirebaseAuth.instance.currentUser!.uid)
// //         .get()
// //         .then((snapshot) async {
// //       if (snapshot.exists) {
// //         setState(() {
// //           name = snapshot.data()!["FIRST_NAME"] +
// //               ' ' +
// //               snapshot.data()!["LAST_NAME"];
// //           email = snapshot.data()!["EMAIL"];
// //           image = snapshot.data()!["IMAGE"];
// //           score = snapshot.data()!["Score"];
// //         });
// //       }
// //     });
// //   }

// //   @override
// //   void initState() {
// //     // TODO: implement initState
// //     super.initState();
// //     _getDataFromDatabase();
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         flexibleSpace: Container(
// //           decoration: BoxDecoration(
// //               gradient: LinearGradient(
// //             colors: [
// //               Color.fromARGB(255, 245, 153, 156),
// //               Color.fromARGB(255, 159, 233, 247)
// //             ],
// //             begin: Alignment.centerLeft,
// //             end: Alignment.centerRight,
// //             stops: const [0.2, 0.9],
// //           )),
// //         ),
// //         centerTitle: true,
// //         backgroundColor: Color.fromARGB(255, 229, 214, 168),
// //         title: const Center(
// //           child: Text(
// //             'Profile',
// //             style: TextStyle(
// //               fontSize: 35,
// //               color: Colors.white,
// //               fontWeight: FontWeight.bold,
// //               fontFamily: "Signatra",
// //             ),
// //           ),
// //         ),
// //         leading: IconButton(
// //           icon: const Icon(
// //             Icons.arrow_back,
// //             color: Colors.white,
// //           ),
// //           onPressed: () {
// //             Navigator.pushReplacement(
// //                 context, MaterialPageRoute(builder: (_) => NavBar()));
// //           },
// //         ),
// //       ),
// //       body: Container(
// //         decoration: BoxDecoration(
// //           gradient: LinearGradient(
// //             colors: [
// //               Color.fromARGB(255, 222, 156, 77),
// //               Color.fromARGB(255, 136, 208, 239)
// //             ],
// //             begin: Alignment.centerLeft,
// //             end: Alignment.centerRight,
// //             stops: const [0.2, 0.9],
// //           ),
// //         ),
// //         child: Column(
// //           crossAxisAlignment: CrossAxisAlignment.center,
// //           mainAxisAlignment: MainAxisAlignment.center,
// //           children: [
// //             GestureDetector(
// //               onTap: () {
// //                 // show image
// //               },
// //               child: CircleAvatar(
// //                 backgroundColor: Colors.white,
// //                 minRadius: 60.0,
// //                 child: CircleAvatar(
// //                   radius: 55.0,
// //                   backgroundImage: imageFile == null
// //                       ? NetworkImage(image!)
// //                       : Image.file(imageFile!).image,
// //                 ),
// //               ),
// //             ),
// //             const SizedBox(
// //               height: 10.0,
// //             ),
// //             Row(
// //               crossAxisAlignment: CrossAxisAlignment.center,
// //               mainAxisAlignment: MainAxisAlignment.center,
// //               children: [
// //                 Text(
// //                   'Name: ' + name!,
// //                   style: const TextStyle(
// //                     fontSize: 25.0,
// //                     fontWeight: FontWeight.bold,
// //                     color: Colors.black,
// //                   ),
// //                 ),
// //                 /*IconButton(
// //                   onPressed: () {
// //                     //display text input
// //                   },
// //                   icon: Icon(Icons.edit),
// //                 ),*/ // to edit
// //               ],
// //             ),
// //             const SizedBox(
// //               height: 10.0,
// //             ),
// //             Text(
// //               'Email: ' + email!,
// //               style: const TextStyle(
// //                 fontSize: 20.0,
// //                 color: Colors.black,
// //               ),
// //             ),
// //             const SizedBox(
// //               height: 10.0,
// //             ),
// //             Text(
// //               "Score= " + score.toString(),
// //               style: const TextStyle(
// //                 fontSize: 20.0,
// //                 color: Colors.black,
// //               ),
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }
// // */
// //   editProfile({required String currentUserId}) {
// //     Navigator.push(
// //         context,
// //         MaterialPageRoute(
// //             builder: (context) =>
// //                 editProfile(currentUserId: '${loggedInUser.uid}')));
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     double width = MediaQuery.of(context).size.width;
// //     double height = MediaQuery.of(context).size.height;
// //     return Stack(
// //       fit: StackFit.expand,
// //       children: [
// //         Container(
// //           decoration: BoxDecoration(
// //             gradient: LinearGradient(
// //               colors: [
// //                 Color.fromARGB(255, 223, 115, 115),
// //                 Color.fromARGB(255, 156, 203, 247),
// //                 //Color.fromARGB(255, 219, 106, 98), //Color.fromARGB(255, 235, 87, 87)
// //                 //Color.fromARGB(255, 85, 98, 199),
// //               ],
// //               begin: FractionalOffset.bottomCenter,
// //               end: FractionalOffset.topCenter,
// //             ),
// //           ),
// //         ),
// //         Scaffold(
// //           //extendBodyBehindAppBar: true,
// //           appBar: AppBar(
// //             title: Text('Profile'),
// //             centerTitle: true,
// //             backgroundColor: Colors.transparent,
// //             elevation: 0,
// //           ),
// //           backgroundColor: Colors.transparent,
// //           body: SingleChildScrollView(
// //             physics: BouncingScrollPhysics(),
// //             child: Padding(
// //               padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 73),
// //               child: Column(
// //                 children: [
// //                   /* Row(
// //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //                     children: [
// //                       Icon(
// //                         Icons.arrow_back,
// //                         color: Colors.white,
// //                       ),
// //                       Icon(
// //                         Icons.logout,
// //                         color: Colors.white,
// //                       ),
// //                     ],
// //                   ),*/
// //                   /*SizedBox(
// //                     height: 20,
// //                   ),
// //                   Text(
// //                     'My Profile',
// //                     textAlign: TextAlign.center,
// //                     style: TextStyle(
// //                       color: Colors.white,
// //                       fontSize: 34,
// //                       fontFamily: 'Nisebuschgardens',
// //                     ),
// //                   ),*/
// //                   // SizedBox(
// //                   //   height: 22,
// //                   // ),
// //                   Container(
// //                     height: height * 0.5,
// //                     child: LayoutBuilder(
// //                       builder: (context, constraints) {
// //                         double innerHeight = constraints.maxHeight;
// //                         double innerWidth = constraints.maxWidth;
// //                         return Stack(
// //                           fit: StackFit.expand,
// //                           children: [
// //                             Positioned(
// //                               bottom: 0,
// //                               left: 0,
// //                               right: 0,
// //                               child: Container(
// //                                 height: innerHeight * 0.79,
// //                                 width: innerWidth,
// //                                 decoration: BoxDecoration(
// //                                   borderRadius: BorderRadius.circular(30),
// //                                   color: Colors.white,
// //                                 ),
// //                                 child: Column(
// //                                   children: [
// //                                     SizedBox(
// //                                       height: innerHeight * 0.35,
// //                                     ),
// //                                     Text(
// //                                       '${loggedInUser.firstName} ${loggedInUser.secondName}',
// //                                       style: TextStyle(
// //                                         color: Color.fromRGBO(39, 105, 171, 1),
// //                                         //fontFamily: 'Nunito',
// //                                         fontSize: 37,
// //                                       ),
// //                                     ),
// //                                     SizedBox(
// //                                       height: 5,
// //                                     ),
// //                                     Row(
// //                                       mainAxisAlignment:
// //                                           MainAxisAlignment.center,
// //                                       children: [
// //                                         Column(
// //                                           children: [
// //                                             Text(
// //                                               'Score',
// //                                               style: TextStyle(
// //                                                 color: Colors.grey[700],
// //                                                 //fontFamily: 'Nunito',
// //                                                 fontSize: 25,
// //                                               ),
// //                                             ),
// //                                             Text(
// //                                               '${loggedInUser.score}',
// //                                               style: TextStyle(
// //                                                 color: Color.fromRGBO(
// //                                                     39, 105, 171, 1),
// //                                                 //fontFamily: 'Nunito',
// //                                                 fontSize: 25,
// //                                               ),
// //                                             ),
// //                                           ],
// //                                         ),
// //                                         Padding(
// //                                           padding: const EdgeInsets.symmetric(
// //                                             horizontal: 25,
// //                                             vertical: 8,
// //                                           ),
// //                                           child: Container(
// //                                             height: 50,
// //                                             width: 3,
// //                                             decoration: BoxDecoration(
// //                                               borderRadius:
// //                                                   BorderRadius.circular(100),
// //                                               color: Colors.grey,
// //                                             ),
// //                                           ),
// //                                         ),
// //                                         Column(
// //                                           children: [
// //                                             Text(
// //                                               'level',
// //                                               style: TextStyle(
// //                                                 color: Colors.grey[700],
// //                                                 //fontFamily: 'Nunito',
// //                                                 fontSize: 25,
// //                                               ),
// //                                             ),
// //                                             Text(
// //                                               '${loggedInUser.level}',
// //                                               style: TextStyle(
// //                                                 color: Color.fromRGBO(
// //                                                     39, 105, 171, 1),
// //                                                 //fontFamily: 'Nunito',
// //                                                 fontSize: 25,
// //                                               ),
// //                                             ),
// //                                           ],
// //                                         ),
// //                                       ],
// //                                     )
// //                                   ],
// //                                 ),
// //                               ),
// //                             ),
// //                             /*Positioned(
// //                               top: 110,
// //                               right: 20,
// //                               child: Icon(
// //                                 Icons.settings,
// //                                 color: Colors.grey[700],
// //                                 size: 30,
// //                               ),
// //                             ),*/
// //                             Positioned(
// //                               top: 0,
// //                               left: 0,
// //                               right: 0,
// //                               child: Center(
// //                                 child: Container(
// //                                   child: Image.asset(
// //                                     'images/profile-icon-design-free-vector.jpg',
// //                                     width: innerWidth * 0.45,
// //                                     fit: BoxFit.fitWidth,
// //                                   ),
// //                                 ),
// //                               ),
// //                             ),
// //                           ],
// //                         );
// //                       },
// //                     ),
// //                   ),
// //                   SizedBox(
// //                     height: 40,
// //                   ),
// //                   Container(
// //                     // height: height * 0.5,
// //                     width: width,
// //                     decoration: BoxDecoration(
// //                       borderRadius: BorderRadius.circular(30),
// //                       color: Colors.white,
// //                     ),
// //                     child: Padding(
// //                       padding: const EdgeInsets.symmetric(horizontal: 15),
// //                       child: Column(
// //                         children: [
// //                           SizedBox(
// //                             height: 20,
// //                           ),
// //                           Text(
// //                             'Scoreboard',
// //                             style: TextStyle(
// //                               color: Color.fromRGBO(39, 105, 171, 1),
// //                               fontSize: 27,
// //                               //fontFamily: 'Nunito',
// //                             ),
// //                           ),
// //                           Divider(
// //                             thickness: 2.5,
// //                           ),
// //                           SizedBox(
// //                             height: 10,
// //                           ),
// //                           Container(
// //                             decoration: BoxDecoration(
// //                                 image: DecorationImage(
// //                                     image: AssetImage(
// //                                         'images/1_l__xN8qEkukiGk26cbKiCw.png'),
// //                                     fit: BoxFit.cover)),
// //                             height: 200, //height * 0.15,
// //                             // decoration: BoxDecoration(
// //                             //   color: Colors.grey,
// //                             //   borderRadius: BorderRadius.circular(30),
// //                             // ),
// //                           ),
// //                           SizedBox(
// //                             height: 10,
// //                           ),
// //                           // Container(
// //                           //   height: 40, //height * 0.15,
// //                           //   decoration: BoxDecoration(
// //                           //     color: Colors.grey,
// //                           //     borderRadius: BorderRadius.circular(30),
// //                           //   ),
// //                           // ),
// //                           SizedBox(
// //                             //the bottom padding
// //                             height: 20,
// //                           ),
// //                         ],
// //                       ),
// //                     ),
// //                   ),
// //                   SizedBox(
// //                     height: 30,
// //                   ),
// //                   Container(
// //                     // height: height * 0.5,
// //                     width: width,
// //                     decoration: BoxDecoration(
// //                       borderRadius: BorderRadius.circular(30),
// //                       color: Colors.white,
// //                     ),
// //                     child: Padding(
// //                       padding: const EdgeInsets.symmetric(horizontal: 15),
// //                       child: Column(
// //                         children: [
// //                           SizedBox(
// //                             height: 20,
// //                           ),
// //                           Text(
// //                             'My Achievements',
// //                             style: TextStyle(
// //                               color: Color.fromRGBO(39, 105, 171, 1),
// //                               fontSize: 27,
// //                               //fontFamily: 'Nunito',
// //                             ),
// //                           ),
// //                           Divider(
// //                             thickness: 2.5,
// //                           ),
// //                           SizedBox(
// //                             height: 10,
// //                           ),
// //                           Container(
// //                             height: 40, //height * 0.15,
// //                             decoration: BoxDecoration(
// //                               color: Colors.grey,
// //                               borderRadius: BorderRadius.circular(30),
// //                             ),
// //                           ),
// //                           SizedBox(
// //                             height: 10,
// //                           ),
// //                           Container(
// //                             height: 40, //height * 0.15,
// //                             decoration: BoxDecoration(
// //                               color: Colors.grey,
// //                               borderRadius: BorderRadius.circular(30),
// //                             ),
// //                           ),
// //                           SizedBox(
// //                             //the bottom padding
// //                             height: 20,
// //                           ),
// //                         ],
// //                       ),
// //                     ),
// //                   ),
// //                 ],
// //               ),
// //             ),
// //           ),
// //         )
// //       ],
// //     );
// //   }
// // }


// // //https://www.youtube.com/watch?v=4izADcEsH8Y