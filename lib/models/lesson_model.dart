class LessonModle {
  String? id;
  Map<dynamic, dynamic>? parts;

  LessonModle();

  // Map<String, dynamic> toJson() => {'title': title, 'description': des, 'modle': modle};
  LessonModle.fromSnapshot(snapshot)
      : id = snapshot.data()['name'],
        parts = snapshot.data()['parts'];
}
