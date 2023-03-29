import 'package:alqgp/Src/Screens/Authenticate/LogIn/login.dart';
import 'package:alqgp/Src/Services/auth_repo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgotPasswordController extends GetxController {
  static ForgotPasswordController get instance => Get.find();

  final authRepo = Get.put(AuthenticationRepository());

  // TextField Controllers to get data from TextFields
  final email = TextEditingController();

  //this Function will be called from Design & it will do the logec behind it
  Future<void> resetPass(String email) async {
    String? error = await authRepo.resetPass(email);
    if (error != null) {
      Get.snackbar("error", error.toString(),
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red.withOpacity(0.3),
          colorText: Colors.red);
    } else {
      Get.snackbar("Success", "The email has been sent successfully.",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green.withOpacity(0.33),
          colorText: Colors.green);
      Get.off(() => const LoginScreen());
    }
  }
}
