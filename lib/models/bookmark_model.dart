class BookmarkModle {
  String? title;
  String? id;
  String? des;
  String? modle;

  BookmarkModle();

  // Map<String, dynamic> toJson() => {'title': title, 'description': des, 'modle': modle};
  BookmarkModle.fromSnapshot(snapshot)
      : title = snapshot.data()['title'],
        des = snapshot.data()['description'],
        modle = snapshot.data()['modle'],
        id = snapshot.data()['name'];
}
