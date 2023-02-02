import 'dart:ffi';

class UserModel {
  String? uid;
  String? email;
  String? firstName;
  String? secondName, image;
  int? score;
  int? level;
  List? bookmarks;

  UserModel({
    this.uid,
    this.email,
    this.firstName,
    this.secondName,
    this.score,
    this.level,
    this.image,
    this.bookmarks,
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
    };
  }
}
