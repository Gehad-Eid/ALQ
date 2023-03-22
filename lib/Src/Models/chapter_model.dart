import 'package:cloud_firestore/cloud_firestore.dart';

class Chapter {
  String? chapterName, chapterImage, photo, id;
  Map<String, dynamic>? parts;
  int? chapNum, chapCont;
  Chapter({
    this.id,
    this.chapterImage,
    this.chapterName,
    this.photo,
    this.chapNum,
    this.chapCont,
  });

  // Map user fetched from Firebase to chapter Model
  factory Chapter.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;

    return Chapter(
      id: document.id,
      chapterImage: data["chapterImage"],
      chapterName: data["chapterName"],
      photo: data["photo"],
      chapNum: data["chapNum"],
      chapCont: data["chapCont"],
    );
  }
}

// ******* add this list to db -- hajar
List<Chapter> ChaptersList = [
  Chapter(
    chapterName: "Circulatory system",
    chapterImage: 'images/heart.png',
    photo: 'images/Picture4.png',
    chapNum: 1,
    chapCont: 4,
  ),
  Chapter(
    chapterName: "Respiratory system",
    chapterImage: 'images/lung.png',
    photo: 'images/Picture1.png',
    chapNum: 2,
    chapCont: 6,
  ),
  Chapter(
    chapterName: "Digestive system",
    chapterImage: 'images/digestive-system(1).png',
    photo: 'images/Picture2.png',
    chapNum: 3,
    chapCont: 5,
  ),
  Chapter(
    chapterName: "Urinary system",
    chapterImage: 'images/urinary.png',
    photo: 'images/Picture5.png',
    chapNum: 4,
    chapCont: 3,
  ),
  Chapter(
    chapterName: "Muscular system",
    chapterImage: 'images/muscular.png',
    photo: 'images/Picture3.png',
    chapNum: 5,
    chapCont: 2,
  ),
];
