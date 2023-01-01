// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';

import '../models/achive_modle.dart';
import '../models/chapter_model.dart';
import 'chapterContent.dart';

class chapters extends StatelessWidget {
  const chapters({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Color.fromARGB(255, 243, 247, 248),
      appBar: AppBar(
        elevation: 0,
        title: const Text(
          'Learning',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        children: <Widget>[
          // Padding(
          //   padding: const EdgeInsets.only(left: 20.0, top: 40.0),
          //   child: Text(
          //     'let\'s learn togither',
          //     style: Theme.of(context)
          //         .textTheme
          //         .headline5
          //         ?.copyWith(fontWeight: FontWeight.bold),
          //   ),
          // ),
          Expanded(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0),
              child: GridView.builder(
                  itemCount: achieveList.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    //mainAxisSpacing: 5.0,
                    crossAxisSpacing: 20.0,
                    childAspectRatio: 0.75,
                  ),
                  itemBuilder: ((context, index) =>
                      chiCard(chi: storeItems[index], indx: index))),
            ),
          ),
        ],
      ),
    );
  }
}

class chiCard extends StatelessWidget {
  final Store chi;
  final int indx;
  const chiCard({
    Key? key,
    required this.chi,
    required this.indx,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => chapCont(
                    chap: storeItems[indx],
                  ))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(20.0),
            // height: 180,
            // width: 160,
            decoration: BoxDecoration(
              color: Colors.purple.shade200,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Image.asset(chi.itemImage),
          ),
          // Padding(
          //   padding: const EdgeInsets.symmetric(vertical: 4.0),
          //   child: Text(
          //     chi.itemName,
          //     style: TextStyle(color: Colors.black38),
          //   ),
          // ),
          Center(
            child: Text(
              chi.itemName,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
          ),
        ],
      ),
    );
  }
}
