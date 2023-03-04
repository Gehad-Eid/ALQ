import 'package:alqgp/Src/Screens/Home/home.dart';
import 'package:alqgp/Src/Services/auth_repo.dart';
import 'package:get/get.dart';

class OTPController extends GetxController {
  static OTPController get instance => Get.find();

  void verifyOTP(String otp) async {
    var isVerified = await AuthenticationRepository.instance.verifyOTP(otp);
    isVerified ? Get.offAll(Home()) : Get.back();
  }
}
