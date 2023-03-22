import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String? uid, fullName, email, phoneNo;
  int? score, ch1prog, ch2prog, ch3prog, ch4prog, ch5prog;

  //******** add those to db && toJson method */
  bool? statusCh1, statusCh2, statusCh3, statusCh4, statusCh5;

  UserModel({
    this.uid,
    this.email,
    this.fullName,
    this.phoneNo,
    this.score = 0,
    this.statusCh1 = false,
    this.statusCh2 = false,
    this.statusCh3 = false,
    this.statusCh4 = false,
    this.statusCh5 = false,
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
      statusCh1: data["statusCh1"],
      statusCh2: data["statusCh2"],
      statusCh3: data["statusCh3"],
      statusCh4: data["statusCh4"],
      statusCh5: data["statusCh5"],
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
