import 'package:flutter/material.dart';

class bookMark extends StatefulWidget {
  const bookMark({super.key});

  @override
  State<bookMark> createState() => _bookMarkState();
}

class _bookMarkState extends State<bookMark> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text(
          'Bookmarks',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
      ),
      body: Column(),
    );
  }
}
