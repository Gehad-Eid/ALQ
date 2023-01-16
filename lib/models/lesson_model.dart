/* class LessonModle {
  String? id;
  Map<dynamic, dynamic>? parts;

  LessonModle();

  // Map<String, dynamic> toJson() => {'title': title, 'description': des, 'modle': modle};
  LessonModle.fromSnapshot(snapshot)
      : id = snapshot.data()['name'],
        parts = snapshot.data()['parts'];
} */
import 'package:alqgp/models/part_model.dart';

class LessonModle {
  String? name;
  //PartModel? part1 ,part2 ,part3;
  List<PartModel>? parts;
  LessonModle({this.name, this.parts});

  // receiving data from server
  factory LessonModle.fromMap(Map<String, dynamic> map) {
    List<PartModel> partList = [];
    int count = 1;
    while (true) {
      if (map.containsKey('part$count')) {
        partList.add(PartModel.fromMap(map['part$count']));
        count++;
      } else {
        break;
      }
    }

    return LessonModle(
      name: map['name'],
      parts: partList,
    );
  }
}
