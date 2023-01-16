import 'package:alqgp/models/lesson_model.dart';

class Chapter {
  String? name;
  String? image, photo, docId;
  num? id;

  Chapter({this.image, this.name, this.photo, this.id, this.docId});

  // receiving data from server
  factory Chapter.fromMap(map) {
    return Chapter(
      name: map['name'],
      image: map['image'],
      photo: map['firstName'],
      id: map['id'],
    );
  }
}

List<Chapter> chapterList = [
  Chapter(
    id: 1,
    name: "Circulatory system",
    image: 'images/heart.png',
    photo: 'images/Picture4.png',
  ),
  Chapter(
    id: 2,
    name: "Respiratory system",
    image: 'images/lung.png',
    photo: 'images/Picture1.png',
  ),
  Chapter(
    id: 3,
    name: "Digestive system",
    image: 'images/digestive-system(1).png',
    photo: 'images/Picture2.png',
  ),
  Chapter(
    id: 4,
    name: "Urinary system",
    image: 'images/urinary.png',
    photo: 'images/Picture5.png',
  ),
  Chapter(
    id: 5,
    name: "Muscular system",
    image: 'images/muscular.png',
    photo: 'images/Picture3.png',
  ),
];

/*class Chapter {
  String chapterName;
  String chapterImage, photo;
  int chapNum;
  Chapter.items({
    required this.chapterImage,
    required this.chapterName,
    required this.photo,
    required this.chapNum,
  });

  get name => null;

  get image => null;

  get id => null;

  set docId(String docId) {}

  static Chapter fromMap(Object? allData) {}
}

List<Chapter> chapterList = [
  Chapter.items(
    chapterName: "Circulatory system",
    chapterImage: 'images/heart.png',
    photo: 'images/Picture4.png',
    chapNum: 1,
  ),
  Chapter.items(
    chapterName: "Respiratory system",
    chapterImage: 'images/lung.png',
    photo: 'images/Picture1.png',
    chapNum: 2,
  ),
  Chapter.items(
    chapterName: "Digestive system",
    chapterImage: 'images/digestive-system(1).png',
    photo: 'images/Picture2.png',
    chapNum: 3,
  ),
  Chapter.items(
    chapterName: "Urinary system",
    chapterImage: 'images/urinary.png',
    photo: 'images/Picture5.png',
    chapNum: 4,
  ),
  Chapter.items(
    chapterName: "Muscular system",
    chapterImage: 'images/muscular.png',
    photo: 'images/Picture3.png',
    chapNum: 5,
  ),
];
*/