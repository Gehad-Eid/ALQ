import 'dart:ffi';

class UserModel {
  String? uid;
  String? email;
  String? firstName;
  String? secondName, image;
  int? score;
  int? level;
  List? bookmarks;
  int? ch1;
  int? ch2;
  int? ch3;
  int? ch4;
  int? ch5;

  UserModel({
    this.uid,
    this.email,
    this.firstName,
    this.secondName,
    this.score,
    this.level,
    this.image,
    this.bookmarks,
    this.ch1,
    this.ch2,
    this.ch3,
    this.ch4,
    this.ch5,
  });

  // receiving data from server
  factory UserModel.fromMap(map) {
    return UserModel(
      uid: map['uid'],
      email: map['email'],
      firstName: map['firstName'],
      secondName: map['secondName'],
      score: map['score'],
      level: map['level'],
      image: map['image'],
      bookmarks: map['bookmark'],
      ch1: map['ch1'],
      ch2: map['ch2'],
      ch3: map['ch3'],
      ch4: map['ch4'],
      ch5: map['ch5'],
    );
  }

  // sending data to our server
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'firstName': firstName,
      'secondName': secondName,
      'score': score,
      'level': level,
      'image': image,
      'bookmark': [],
      'ch1': 0,
      'ch2': 0,
      'ch3': 0,
      'ch4': 0,
      'ch5': 0,
    };
  }
}
