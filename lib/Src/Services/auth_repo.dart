import 'package:alqgp/Src/Models/user_model.dart';
import 'package:alqgp/Src/Screens/Authorized/homeWrapper.dart';
import 'package:alqgp/Src/Screens/welcome.dart';
import 'package:alqgp/Src/Services/exeptions/signin_e.dart';
import 'package:alqgp/Src/Services/user_repo.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  //Variables
  final _auth = FirebaseAuth.instance;
  late final Rx<User?> firebaseUser;
  var verificationId = ''.obs;

  final userRepo = Get.put(UserRepository());

  //Will be called when app launches and set the firebaseUser state
  @override
  void onReady() async {
    await Future.delayed(const Duration(seconds: 7)); // waiting for splash
    firebaseUser = Rx<User?>(_auth.currentUser);
    firebaseUser.bindStream(_auth.userChanges()); //keep the values in sync
    ever(firebaseUser, _setInitialScreen); // do action when the status changes
  }

  //first screen
  _setInitialScreen(User? user) {
    user == null
        ? Get.offAll(() => const WelcomeScreen())
        : Get.offAll(() => HomeWrapper());
  }

  //FUNCs

  //authantictes the user phone No. by sending OTP code
  Future<bool> phoneAuthentication(String phoneNo) async {
    bool state = true;
    await _auth.verifyPhoneNumber(
      phoneNumber: phoneNo,
      verificationCompleted: (credential) async {}, //if error in otp del async
      codeSent: (verificationId, resendToken) {
        this.verificationId.value = verificationId;
      },
      codeAutoRetrievalTimeout: (verificationId) {
        this.verificationId.value = verificationId;
      },
      verificationFailed: (e) {
        if (e.code == 'invalid-phone-number') {
          Get.snackbar('Error', 'The provided phone number is not valid.');
        } else {
          Get.snackbar('Error', 'Something went wrong. Try again.');
        }
        state = false;
      },
    );
    return state;
  }

  //makes sure that the OTP code dose work and correct by checking the credential
  Future verifyOTP(String otp) async {
    var credentials = PhoneAuthProvider.credential(
        verificationId: verificationId.value, smsCode: otp);
    return credentials != null ? true : false;
  }

  //creates a new user to log in with email and passwordin firebase auth
  Future<bool> createUserWithEmailAndPassword(
      String email, String password, UserModel user) async {
    bool state = true;
    try {
      await _auth
          .createUserWithEmailAndPassword(email: email, password: password)
          //creates a doc in firebase firestore
          .then((value) => {userRepo.createUser(user, value.user!.uid)});
      firebaseUser.value != null
          ? Get.offAll(() => HomeWrapper()) //log in
          : Get.to(() => const WelcomeScreen());
    } on FirebaseAuthException catch (e) {
      final ex = SignWithEmailAndPasswordFailure.code(e.code);
      state = false;
      Get.snackbar("Error", ex.message,
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.redAccent.withOpacity(0.1),
          colorText: Colors.red);
    } catch (e) {
      final ex = SignWithEmailAndPasswordFailure.code(e.toString());
      state = false;
      Get.snackbar("Error", ex.message,
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.redAccent.withOpacity(0.1),
          colorText: Colors.red);
    }
    return state;
  }

// Log in the user with thier email and password
  Future<String?> loginWithEmailAndPassword(
      String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      final ex = SignWithEmailAndPasswordFailure.code(e.code);
      return ex.message;
    } catch (e) {
      final ex = SignWithEmailAndPasswordFailure.code(e.toString());
      return ex.message;
    }
    return null;
  }

// Logs out the user
  Future<void> logout() async => await _auth.signOut();

//resets the user password
//**** add snake bar  */
  Future<String?> resetPass(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      final ex = SignWithEmailAndPasswordFailure.code(e.code);
      return ex.message;
    } catch (e) {
      final ex = SignWithEmailAndPasswordFailure.code(e.toString());
      return ex.message;
    }
    return null;
  }
}
