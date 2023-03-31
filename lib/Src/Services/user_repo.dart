import 'package:alqgp/Src/Models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();

  // //opserving the user data
  // Rx<UserModel> _currentUser = UserModel().obs;

  // UserModel get user => _currentUser.value;

  // set user(UserModel value) => this._currentUser.value = value;

  final _db = FirebaseFirestore.instance;

  // Store the user in Firestore
  createUser(UserModel user, String uid) async {
    await _db
        .collection("Users")
        .doc(uid)
        .set(user.toJson())
        .whenComplete(
          () => Get.snackbar(
              "Success", "Your account has been created successfully.",
              snackPosition: SnackPosition.BOTTOM,
              backgroundColor: Colors.white.withOpacity(0.5),
              colorText: Colors.green),
        )
        .catchError((error, stackTrace) {
      Get.snackbar("Error", error.toString(), //somthing went wrong
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.redAccent
              .withOpacity(0.1), // ******* Colors.white.withOpacity(0.5),
          colorText: Colors.red);
    });
  }

  // Fetch User details for the edit profile
  Future<UserModel> getUserDetails(String uid) async {
    final snapshot = await _db.collection("Users").doc(uid).get();
    final userData = UserModel.fromSnapshot(snapshot);
    return userData;
  }

// Fetch User details and sync it
  Stream<UserModel> theUser(String uid) {
    return _db.collection("Users").doc(uid).snapshots().map((data) {
      UserModel user = UserModel.fromSnapshot(data);

      return user;
    });
  }

  // Future<UserModel> getUserDetails(String email) async {
  //   final snapshot =
  //       await _db.collection("Users").where("Email", isEqualTo: email).get();
  //   final userData = snapshot.docs.map((e) => UserModel.fromSnapshot(e)).single;
  //   return userData;
  // }

  // Fetch All Users details
  Future<List<UserModel>> allUsers() async {
    final snapshot = await _db.collection("Users").get();
    final userData =
        snapshot.docs.map((e) => UserModel.fromSnapshot(e)).toList();
    return userData;
  }

  //update the user's data
  Future<void> updateUserRecord(UserModel user, String uid) async {
    await _db.collection("Users").doc(uid).update(user.toJson());
  }
}
