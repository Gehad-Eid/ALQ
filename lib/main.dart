import 'package:flutter/material.dart';
import 'screens/home.dart';
import 'screens/chapters.dart';

void main() {
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
      home: const header(),
    );
  }
}
