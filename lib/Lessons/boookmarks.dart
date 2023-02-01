import 'dart:ffi';

import 'package:alqgp/models/bookmark_model.dart';
import 'package:alqgp/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class bookMark extends StatefulWidget {
  const bookMark({super.key, required this.loggedInUser});
  final UserModel loggedInUser;

  @override
  State<bookMark> createState() => _bookMarkState(loggedInUser);
}

class _bookMarkState extends State<bookMark> {
  List<Object> _PartsList = [];
   UserModel user = UserModel();
  _bookMarkState(UserModel loggedInUser){
    user = loggedInUser;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    getBookmarkesList();
  }

  @override
  Widget build(BuildContext context) {
    List<dynamic>? list = user.bookmarks;
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
      body: SafeArea(
          child: ListView.builder(
              itemCount: list!.length,
              padding: EdgeInsets.only(top: 80.0),
              itemBuilder: (context, index) {
                return ListbookMark(index,list);
              })),
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



class ListbookMark extends StatelessWidget {
  int index = 0;
  List listt = [];
  ListbookMark(int index, List list){
    this.index = index;
    listt = list;
  }

  // final ListbookMark _bookMark;
  // ListbookMark(this._bookMark);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Card(
        color: Color.fromARGB(155, 165, 71, 197),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: const EdgeInsets.all(0.0),
          child: Column(children: [
            ListTile(
              title: Center(
                child: Text(
                  //"${_bookMark.name?.split(",")[0]}",
                  "${listt[index]!}",
                  style: const TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              // onTap: () {
              //   Navigator.of(context).push(MaterialPageRoute(
              //       builder: (context) => lessonCont(_lesson)));
              // },
            ),
          ]),
        ),
      ),
    );
  }
}