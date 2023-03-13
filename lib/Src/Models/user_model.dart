import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String? uid, fullName, email, phoneNo;
  int score, ch1prog, ch2prog, ch3prog, ch4prog, ch5prog;

  UserModel({
    this.uid,
    this.email,
    this.fullName,
    this.phoneNo,
    this.score = 0,
    this.ch1prog = 0,
    this.ch2prog = 0,
    this.ch3prog = 0,
    this.ch4prog = 0,
    this.ch5prog = 0,
  });

  // Map user fetched from Firebase to UserModel
  factory UserModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;

    return UserModel(
      uid: document.id,
      fullName: data["FullName"],
      email: data["Email"],
      phoneNo: data["Phone"],
      score: data["score"],
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
      "score": score,
      "ch1prog": ch1prog,
      "ch2prog": ch2prog,
      "ch3prog": ch3prog,
      "ch4prog": ch4prog,
      "ch5prog": ch5prog,
    };
  }
}
