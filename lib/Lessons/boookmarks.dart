import 'package:alqgp/models/bookmark_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class bookMark extends StatefulWidget {
  const bookMark({super.key});

  @override
  State<bookMark> createState() => _bookMarkState();
}

class _bookMarkState extends State<bookMark> {
  List<Object> _PartsList = [];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    getBookmarkesList();
  }

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

  Future getBookmarkesList() async {
    //final uid = auth(
    var data = await FirebaseFirestore.instance.collection('bookmark').get();

    setState(() {
      _PartsList =
          List.from(data.docs.map((e) => BookmarkModle.fromSnapshot(e)));
    });
  }
}
