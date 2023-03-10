import 'package:alqgp/Src/Models/user_model.dart';
import 'package:alqgp/Src/Services/auth_repo.dart';
import 'package:alqgp/Src/Services/user_repo.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  static ProfileController get instance => Get.find();

  final _authRepo = Get.put(AuthenticationRepository());
  final _userRepo = Get.put(UserRepository());

// Get User Email and pass to UserRepository to fetch user record.
  getUserData() {
    final Phone = _authRepo.firebaseUser.value?.phoneNumber;
    if (Phone != null) {
      return _userRepo.getUserDetails(Phone);
    } else {
      Get.snackbar("Error", "Please login to continue.");
      throw '';
    }
  }
}
