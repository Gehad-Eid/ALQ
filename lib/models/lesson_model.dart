class LessonModle {
  String? title;
  String? id;
  String? des;
  String? modle;

  LessonModle();

  // Map<String, dynamic> toJson() => {'title': title, 'description': des, 'modle': modle};
  LessonModle.fromSnapshot(snapshot)
      : title = snapshot.data()['title'],
        des = snapshot.data()['description'],
        modle = snapshot.data()['modle'],
        id = snapshot.data()['name'];
  //id = snapshot.data().Document(doc_id);

  String? getNAme() {
    return id;
  }
}
