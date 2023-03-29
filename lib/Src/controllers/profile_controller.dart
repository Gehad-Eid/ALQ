import 'package:alqgp/Src/Models/user_model.dart';
import 'package:alqgp/Src/Services/auth_repo.dart';
import 'package:alqgp/Src/Services/user_repo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  static ProfileController get instance => Get.find();

  final _authRepo = Get.put(AuthenticationRepository());
  final _userRepo = Get.put(UserRepository());

  RxBool isDark = false.obs;
  changeTheme() {
    if (isDark.value == true) {
      Get.changeTheme(ThemeData.light());
    } else if (isDark.value == false) {
      Get.changeTheme(ThemeData.dark());
    }
    isDark.value = !isDark.value;
  }

  RxBool notshowpass = true.obs;

  changeShow() {
    notshowpass.value = !notshowpass.value;
  }

// Get User Email and pass to UserRepository to fetch user record.
  getUserData() {
    final uid = _authRepo.firebaseUser.value?.uid;
    if (uid != null) {
      return _userRepo.getUserDetails(uid);
    } else {
      Get.snackbar("Error", "Please login to continue.");
      throw '';
    }
  }

  /// Fetch List of user records.
  Future<List<UserModel>> getAllUsers() async => await _userRepo.allUsers();

  //calling the
  updateRecord(UserModel user) async {
    await _userRepo.updateUserRecord(user);
  }
}
