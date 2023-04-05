import 'package:alqgp/Src/Models/achievements_model.dart';
import 'package:alqgp/Src/Models/user_model.dart';
import 'package:alqgp/Src/Services/auth_repo.dart';
import 'package:alqgp/Src/Services/database_repo.dart';
import 'package:alqgp/Src/Services/user_repo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  static HomeController get instance => Get.find();

  final _databaseRepo = Get.put(DatabaseRepository());
  final _authRepo = Get.put(AuthenticationRepository());
  final _userRepo = Get.put(UserRepository());

  Rx<UserModel> user = UserModel().obs;
  UserModel get theUser => user.value;

  // RxBool status = false.obs;
  // RxInt progress = 0.obs;

  RxList<Achievement> achievementList = RxList<Achievement>();
  List<Achievement> get achievements => achievementList;

  @override
  void onInit() {
    super.onInit();
    //  the user from data base to keep track of the changes
    final uid = _authRepo.firebaseUser.value?.uid;
    user.bindStream(_userRepo.theUser(uid!));
    achievementList.bindStream(_databaseRepo.getAchievement());
  }

  setChapterProgress(int chapterNumber) {
    switch (chapterNumber) {
      case 1:
        // status.value = theUser.ch1status!;
        // progress.value =

        return theUser.ch1prog!;
      // break;
      case 2:
        // status.value = theUser.ch2status!;
        // progress.value =
        return theUser.ch2prog!;
      // break;
      case 3:
        // status.value = theUser.ch3status!;
        // progress.value =
        return theUser.ch3prog!;
      // break;
      case 4:
        // status.value = theUser.ch4status!;
        // progress.value =
        return theUser.ch4prog!;
      // break;
      case 5:
        // status.value = theUser.ch5status!;
        // progress.value =
        return theUser.ch5prog!;
      // break;
    }
  }

  setChapterStatus(int chapterNumber) {
    switch (chapterNumber) {
      case 1:
        return theUser.ch1status!;
      case 2:
        return theUser.ch2status!;
      case 3:
        return theUser.ch3status!;
      case 4:
        return theUser.ch4status!;
      case 5:
        return theUser.ch5status!;
    }
  }
}
