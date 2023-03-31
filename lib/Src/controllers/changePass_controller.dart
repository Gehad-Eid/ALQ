import 'package:alqgp/Src/Screens/Authenticate/LogIn/login.dart';
import 'package:alqgp/Src/Services/auth_repo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChangePasswordController extends GetxController {
  static ChangePasswordController get instance => Get.find();

  final authRepo = Get.put(AuthenticationRepository());

  // TextField Controllers to get data from TextFields
  final email = TextEditingController();
  final pass = TextEditingController();
  final newPass = TextEditingController();
  final reNewPass = TextEditingController();
  RxBool notshowpass1 = true.obs;
  RxBool notshowpass2 = true.obs;
  RxBool notshowpass3 = true.obs;

  changeShow1() {
    notshowpass1.value = !notshowpass1.value;
  }

  changeShow2() {
    notshowpass2.value = !notshowpass2.value;
  }

  changeShow3() {
    notshowpass3.value = !notshowpass3.value;
  }

  //this Function will be called from Design & it will do the logec behind it
  Future<void> changetPass() async {
    String? error = await authRepo.changetPass(
        email.text.trim(), pass.text.trim(), newPass.text.trim());
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
