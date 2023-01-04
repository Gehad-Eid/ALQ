import 'package:flutter/material.dart';

class lessons extends StatefulWidget {
  const lessons({super.key});

  @override
  State<lessons> createState() => _lessonsState();
}

class _lessonsState extends State<lessons> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text(
          'Lessons (chande it)',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
      ),
      body: Column(),
    );
  }
}
