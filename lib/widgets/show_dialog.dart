// //@dart=2.8

// import 'dart:async';

// import 'package:flutter/material.dart';

// void showAlertDialog(BuildContext context, String message, bool state) {
//   // set up the AlertDialog
//   AlertDialog alert = AlertDialog(
//     content: Directionality(
//       textDirection: TextDirection.rtl,
//       child: SingleChildScrollView(
//         child: ListBody(
//           children: <Widget>[
//             Center(
//                 child: Icon(
//               state ? Icons.check : Icons.error,
//               color: state ? Colors.green : Colors.red,
//               size: 40,
//             )),
//             const SizedBox(
//               height: 20,
//             ),
//             Center(
//               child: Text(
//                 message,
//                 textAlign: TextAlign.center,
//               ),
//             ),
//           ],
//         ),
//       ),
//     ),
//   );
//   // show the dialog

//   Timer timer;
//   showDialog(
//     context: context,
//     builder: (BuildContext con) {
//       timer = Timer(Duration(seconds: 2), () {
//         Navigator.of(con, rootNavigator: true).pop();
//       });
//       return alert;
//     },
//   ).then((value) {
//     if (timer != null) {
//       timer.cancel();
//       timer = null;
//     }

//     return value;
//   });
// }
