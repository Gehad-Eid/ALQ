import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'screens/chapters.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ALQ',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      //under the "home" property
      //for testing sign in & up : WelcomeScreen()
      //for testing Chapters & profile & whatever else : header()
      home: const header(),
    );
    
  }
}
