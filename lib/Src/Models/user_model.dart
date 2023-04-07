import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String? uid, fullName, email, phoneNo, photo;
  int? score, ch1prog, ch2prog, ch3prog, ch4prog, ch5prog;
  bool? ch1quiz, ch2quiz, ch3quiz, ch4quiz, ch5quiz;

  //******** add those to db && toJson method */
  bool? ch1status, ch2status, ch3status, ch4status, ch5status;

  UserModel(
      {this.uid,
      this.email,
      this.fullName,
      this.phoneNo,
      this.photo = "images/profile2.png",
      this.score = 0,
      this.ch1status = false,
      this.ch2status = false,
      this.ch3status = false,
      this.ch4status = false,
      this.ch5status = false,
      this.ch1prog = 0,
      this.ch2prog = 0,
      this.ch3prog = 0,
      this.ch4prog = 0,
      this.ch5prog = 0,
      this.ch1quiz = false,
      this.ch2quiz = false,
      this.ch3quiz = false,
      this.ch4quiz = false,
      this.ch5quiz = false});

  // Map user fetched from Firebase to UserModel
  factory UserModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;

    return UserModel(
      uid: document.id,
      fullName: data["FullName"],
      email: data["Email"],
      phoneNo: data["Phone"],
      photo: data["photo"],
      score: data["score"],
      ch1quiz: data["ch1quiz"],
      ch2quiz: data["ch2quiz"],
      ch3quiz: data["ch3quiz"],
      ch4quiz: data["ch4quiz"],
      ch5quiz: data["ch5quiz"],
      ch1status: data["ch1status"],
      ch2status: data["ch2status"],
      ch3status: data["ch3status"],
      ch4status: data["ch4status"],
      ch5status: data["ch5status"],
      ch1prog: data["ch1prog"],
      ch2prog: data["ch2prog"],
      ch3prog: data["ch3prog"],
      ch4prog: data["ch4prog"],
      ch5prog: data["ch5prog"],
    );
  }

  // Map user data from UserModel to a map (json form)
  toJson() {
    return {
      "FullName": fullName,
      "Email": email,
      "Phone": phoneNo,
      "photo": photo,
      "score": score,
      "ch1prog": ch1prog,
      "ch2prog": ch2prog,
      "ch3prog": ch3prog,
      "ch4prog": ch4prog,
      "ch5prog": ch5prog,
      "ch1quiz": ch1quiz,
      "ch2quiz": ch2quiz,
      "ch3quiz": ch3quiz,
      "ch4quiz": ch4quiz,
      "ch5quiz": ch5quiz,
      "ch1status": ch1status,
      "ch2status": ch2status,
      "ch3status": ch3status,
      "ch4status": ch4status,
      "ch5status": ch5status,
    };
  }
}
