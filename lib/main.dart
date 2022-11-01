import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:toast/toast.dart';
import 'package:alqgp/screens/login.dart';
import 'package:alqgp/screens/signup.dart';
import 'screens/home.dart';
import 'screens/chapters.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ALQ',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),

      //for testing sign in & up : WelcomeScreen
      //for testing Chapters & profile & whatever else : header
      initialRoute: WelcomeScreen.screenRout,

      routes: {
        WelcomeScreen.screenRout: (context) => WelcomeScreen(),
        SignInScreen.screenRout: (context) => const SignInScreen(),
        //RegistrationScreen.screenRout: (context) => const RegistrationScreen(),
        sign_up.screenRout: (context) => const sign_up(),
        //here will be the :
        //profile
        header.screenRout: (context) => const header(),
        //lessons
      },
    );
  }
}
