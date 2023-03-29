import 'package:alqgp/Src/Services/auth_repo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  static LoginController get instance => Get.find();

  final authRepo = Get.put(AuthenticationRepository());

  // TextField Controllers to get data from TextFields
  final email = TextEditingController();
  final password = TextEditingController();

  RxBool notshowpass = true.obs;

  changeShow() {
    notshowpass.value = !notshowpass.value;
  }

  //this Function will be called from Design & it will do the logec behind it
  Future<void> loginUser(String email, String password) async {
    // if (email == "") {
    //   Get.snackbar("Caution", "Please fill the emaile filed",
    //       snackPosition: SnackPosition.BOTTOM,
    //       backgroundColor: Colors.red.withOpacity(0.33),
    //       colorText: Colors.red);
    // } else if (password == "") {
    //   Get.snackbar("Caution", "Please fill the password filed",
    //       snackPosition: SnackPosition.BOTTOM,
    //       backgroundColor: Colors.red.withOpacity(0.33),
    //       colorText: Colors.red);
    // } else if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
    //     .hasMatch(email)) {
    //   Get.snackbar("Caution", "Please enter a valid email",
    //       snackPosition: SnackPosition.BOTTOM,
    //       backgroundColor: Colors.red.withOpacity(0.33),
    //       colorText: Colors.red);
    // } else if (!RegExp(r'^.{6,}$').hasMatch(password)) {
    //   Get.snackbar(
    //       "Caution", "Please enter a valid Password (Min. 6 Character)",
    //       snackPosition: SnackPosition.BOTTOM,
    //       backgroundColor: Colors.red.withOpacity(0.33),
    //       colorText: Colors.red);
    // } else {
    String? error = await authRepo.loginWithEmailAndPassword(email, password);
    if (error != null) {
      Get.snackbar("error", error.toString(),
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red.withOpacity(0.33),
          colorText: Colors.red);
    }
    // }
  }
}
