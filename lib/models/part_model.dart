import 'package:alqgp/models/lesson_model.dart';

class PartModel {
  String? topic;
  List<String>? textList;
  PartModel({
    this.textList,
    this.topic,
  });

  // receiving data from server
  factory PartModel.fromMap(map) {
    List<String> texts = [];
    if (map['text'] is List<dynamic>) {
      for (String s in map['text']) {
        texts.add(s);
      }
    } else {
      texts.add(map['text']);
    }
    return PartModel(
      topic: map['topic'],
      textList: texts,
    );
  }
}
