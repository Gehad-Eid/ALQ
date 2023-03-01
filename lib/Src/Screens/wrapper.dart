import 'package:alqgp/Src/Screens/Authenticate/authenticate.dart';
import 'package:alqgp/Src/Screens/Home/home.dart';
import 'package:alqgp/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserModel?>(context);
    print('userrrrrrrrrrrrr is : ${user?.uid}');

    // return either the Home or Authenticate widget
    // to ensure the Confidentiality in the CIA triad.
    if (user == null) {
      return Authenticate();
    } else {
      return Home();
    }
  }
}
