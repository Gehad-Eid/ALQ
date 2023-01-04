class Chapter {
  String chapterName;
  String chapterImage, photo;
  Chapter.items({
    required this.chapterImage,
    required this.chapterName,
    required this.photo,
  });
}

List<Chapter> chapterList = [
  Chapter.items(
    chapterName: "Circulatory system",
    chapterImage: 'images/heart.png',
    photo: 'images/Picture4.png',
  ),
  Chapter.items(
    chapterName: "Respiratory system",
    chapterImage: 'images/lung.png',
    photo: 'images/Picture1.png',
  ),
  Chapter.items(
    chapterName: "Digestive system",
    chapterImage: 'images/digestive-system(1).png',
    photo: 'images/Picture2.png',
  ),
  Chapter.items(
    chapterName: "Urinary system",
    chapterImage: 'images/urinary.png',
    photo: 'images/Picture5.png',
  ),
  Chapter.items(
    chapterName: "Muscular system",
    chapterImage: 'images/muscular.png',
    photo: 'images/Picture3.png',
  ),
];
