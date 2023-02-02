import 'dart:async';

import 'package:alqgp/consts.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import "package:flutter/material.dart";

class ChangePassword extends StatefulWidget {
  @override
  _ChangePasswordState createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  TextEditingController passwordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController cNewPasswordController = TextEditingController();
  bool isNewPassword = true;
  bool isPassword = true;
  bool iscNewPassword = true;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
  }

  Widget buildEmailField() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Change your password',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 21,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              'Current password',
              style: TextStyle(
                color: Colors.grey.shade500,
                fontSize: 18,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
                autofocus: false,
                controller: passwordController,
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value!.isEmpty) {
                    return ("Please Enter Your password");
                  }
                  if (value.length < 6) {
                    return ("Current password is wrong");
                  }
                  return null;
                },
                onSaved: (value) {
                  passwordController.text = value!;
                },
                textInputAction: TextInputAction.next,
                obscureText: isPassword,
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        isPassword = !isPassword;
                      });
                    },
                    icon: Icon(
                      isPassword ? Icons.visibility : Icons.visibility_off,
                      color: Colors.black,
                    ),
                  ),
                  contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                  hintText: "",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                )),
            const SizedBox(
              height: 20,
            ),
            Text(
              'New password',
              style: TextStyle(
                color: Colors.grey.shade500,
                fontSize: 18,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
                autofocus: false,
                controller: newPasswordController,
                keyboardType: TextInputType.visiblePassword,
                validator: (value) {
                  if (value!.isEmpty) {
                    return ("Please Enter Your new password");
                  }
                  // reg expression for email validation
                  if (value.length < 6) {
                    return ("Your password should be at least 6 characters");
                  }
                  return null;
                },
                onSaved: (value) {
                  newPasswordController.text = value!;
                },
                textInputAction: TextInputAction.next,
                obscureText: isNewPassword,
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        isNewPassword = !isNewPassword;
                      });
                    },
                    icon: Icon(
                      isNewPassword ? Icons.visibility : Icons.visibility_off,
                      color: Colors.black,
                    ),
                  ),
                  contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                  hintText: "",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                )),
            const SizedBox(
              height: 20,
            ),
            Text(
              'Confirm new password',
              style: TextStyle(
                color: Colors.grey.shade500,
                fontSize: 18,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
                autofocus: false,
                controller: cNewPasswordController,
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value!.isEmpty) {
                    return ("Please Confirm your new password");
                  }
                  if (value.length < 6) {
                    return ("Your password should be at least 6 characters");
                  }
                  return null;
                },
                onSaved: (value) {
                  cNewPasswordController.text = value!;
                },
                textInputAction: TextInputAction.next,
                obscureText: iscNewPassword,
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        iscNewPassword = !iscNewPassword;
                      });
                    },
                    icon: Icon(
                      iscNewPassword ? Icons.visibility : Icons.visibility_off,
                      color: Colors.black,
                    ),
                  ),
                  contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                  hintText: "",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                )),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                InkWell(
                  onTap: () async {
                    final user = FirebaseAuth.instance.currentUser;
                    final credential = EmailAuthProvider.credential(
                        email: user!.email!, password: passwordController.text);
                    try {
                      showDialog(
                        context: context,
                        barrierDismissible: false,
                        builder: (context) => const Center(
                          child: CircularProgressIndicator(),
                        ),
                      );
                      await user.reauthenticateWithCredential(credential);
                      if (newPasswordController.text ==
                          cNewPasswordController.text) {
                        final form = _formKey.currentState;
                        if (form!.validate()) {
                          changePassword(newPasswordController.text);
                        } else {
                          print('invalid');
                        }
                      } else {
                        Navigator.pop(context);
                        showAlertDialog(
                            context,
                            'Make sure that the new password matches the confirmed one',
                            false);
                      }
                    } on FirebaseAuthException catch (e) {
                      Navigator.pop(context);
                      showAlertDialog(context,
                          'Make sure your current password is correct', false);
                    }
                  },
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      border: Border.all(
                        color: Colors.blue,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: Text(
                      'Update password',
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 18,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    passwordController.dispose();
    newPasswordController.dispose();
    cNewPasswordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "Change password",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            Icons.arrow_back,
            size: 30.0,
            color: Colors.black87,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            const SizedBox(
              height: 50,
            ),
            buildEmailField(),
          ],
        ),
      ),
    );
  }

  Future changePassword(String password) async {
    try {
      await FirebaseAuth.instance.currentUser!
          .updatePassword(password)
          .then((_) {
        print("Password changed Successfully");
        Navigator.of(context).popUntil((route) => route.isFirst);
        showAlertDialog(context, 'Password changed Successfully', true);
      }).catchError((error) {
        print("Password can't be changed" + error.toString());
        Navigator.pop(context);
        showAlertDialog(context, 'Password can\'t be changed', false);
        //This might happen, when the wrong password is in, the user isn't found, or if the user hasn't logged in recently.
      });
    } catch (e) {
      Navigator.pop(context);
      print(e);
    }
  }

  void showAlertDialog(BuildContext context, String message, bool state) {
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      content: Directionality(
        textDirection: TextDirection.rtl,
        child: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Center(
                  child: Icon(
                state ? Icons.check : Icons.error,
                color: state ? Colors.green : Colors.red,
                size: 40,
              )),
              const SizedBox(
                height: 20,
              ),
              Center(
                child: Text(
                  message,
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
    // show the dialog
    Timer? timer;
    showDialog(
      context: context,
      builder: (BuildContext con) {
        timer = Timer(Duration(seconds: 2), () {
          Navigator.of(con, rootNavigator: true).pop();
        });
        return alert;
      },
    ).then((value) {
      if (timer != null) {
        timer!.cancel();
        timer = null;
      }

      return value;
    });
  }
}
