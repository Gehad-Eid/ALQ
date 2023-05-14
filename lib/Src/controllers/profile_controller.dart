import 'package:alqgp/Src/Models/user_model.dart';
import 'package:alqgp/Src/Services/auth_repo.dart';
import 'package:alqgp/Src/Services/user_repo.dart';
import 'package:alqgp/Src/Utils/Theme/theme.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  static ProfileController get instance => Get.find();

  final _authRepo = Get.put(AuthenticationRepository());
  final _userRepo = Get.put(UserRepository());

  RxList<UserModel> users = RxList<UserModel>();
  List<UserModel> get allUsers => users;

  RxString photo = ''.obs;

  @override
  void onInit() {
    super.onInit();
    //  all users from database to keep track of the changes
    users.bindStream(_userRepo.allUsers());
  }

  RxBool isDark = false.obs;
  changeTheme() {
    if (isDark.value == true) {
      Get.changeTheme(TAppTheme.lightTheme);
    } else if (isDark.value == false) {
      Get.changeTheme(TAppTheme.darkTheme);
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

    return _userRepo.getUserDetails(uid!);
  }

// delete the user form the db
  deleteUser() async {
    final uid = _authRepo.firebaseUser.value?.uid;

    await _userRepo.deleteUser(uid!);
    _authRepo.deleteUser();
  }

  //calling the update to update the user
  updateRecord(String name, String phone, String photoPram) async {
    final uid = _authRepo.firebaseUser.value?.uid;
    await _userRepo.updateUserRecord(name, phone, photoPram, uid!);
    photo.value = "";
    Get.close(1);
  }
}
