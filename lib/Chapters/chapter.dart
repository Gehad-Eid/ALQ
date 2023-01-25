import 'package:alqgp/screens/new_structure/chapter_lessons_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../models/achive_modle.dart';
import '../models/chapter_model.dart';
import 'chapterContent.dart';

class chapters extends StatefulWidget {
  @override
  State<chapters> createState() => _chaptersState();
}

class _chaptersState extends State<chapters> {
  final CollectionReference _collectionRef =
      FirebaseFirestore.instance.collection('chapters');

  Future<List<Chapter>?> getChapters() async {
    // Get docs from collection reference
    QuerySnapshot querySnapshot = await _collectionRef.get();

    // Get data from docs and convert map to List
    final allData = querySnapshot.docs.map((doc) => doc.data()).toList();
    myChapters!.clear();
    for (int i = 0; i < allData.length; i++) {
      myChapters!.add(Chapter.fromMap(allData[i]));
      myChapters![i].docId = querySnapshot.docs[i].id;
    }
    return myChapters;
  }

  Future<List<Chapter>>? fChapters;

  List<Chapter>? myChapters = [];

  @override
  void initState() {
    fChapters = getChapters() as Future<List<Chapter>>?;
    fChapters!.then((value) {
      myChapters = value;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    getChapters();
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
          Expanded(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0),
              child: FutureBuilder(
                  future: fChapters,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return GridView.builder(
                          itemCount: myChapters!.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            //mainAxisSpacing: 5.0,
                            crossAxisSpacing: 20.0,
                            childAspectRatio: 0.75,
                          ),
                          itemBuilder: ((context, index) {
                            return chapterCard(
                              name: myChapters![index].name!,
                              image: chapterList![index].image!,
                              id: ((myChapters![index].id!) - 1),
                              myChapter: myChapters![index],
                            );
                          }));
                    } else {
                      return SizedBox(
                        height: size.height * .8,
                        width: size.width,
                        child: Center(
                          child: Container(
                              width: 50,
                              height: 50,
                              child: const CircularProgressIndicator(
                                valueColor: AlwaysStoppedAnimation<Color>(
                                    Color.fromARGB(255, 155, 140, 181)),
                                backgroundColor: Colors.deepPurple,
                              )),
                        ),
                      );
                    }
                  }),
            ),
          ),
        ],
      ),
    );
  }
}

class chapterCard extends StatelessWidget {
  String name;
  String image;
  num id;
  Chapter myChapter;
  chapterCard({
    Key? key,
    required this.name,
    required this.id,
    required this.image,
    required this.myChapter,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ChapterLessonsScreen(
                    chapter: myChapter,
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
            child: Image.asset(image),
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
              name,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
          ),
        ],
      ),
    );
  }
}


/* import 'package:flutter/material.dart';
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
                      chapterCard(chapter: chapterList[index], indx: index))),
            ),
          ),
        ],
      ),
    );
  }
}

class chapterCard extends StatelessWidget {
  final Chapter chapter;
  final int indx;
  const chapterCard({
    Key? key,
    required this.chapter,
    required this.indx,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => chapCont(
                    chapter: chapterList[indx],
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
            child: Image.asset(chapter.chapterImage),
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
              chapter.chapterName,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
          ),
        ],
      ),
    );
  }
}*/
