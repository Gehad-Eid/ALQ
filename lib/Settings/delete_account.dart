import 'package:alqgp/Main/logIn.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import "package:flutter/material.dart";

class DeleteAcc extends StatefulWidget {
  @override
  _DeleteAccState createState() => _DeleteAccState();
}

class _DeleteAccState extends State<DeleteAcc> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  void initState() {
    super.initState();
  }

  bool _isLoading = false;
  Widget buildEmailField() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: TextFormField(
              autofocus: false,
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              validator: (value) {
                if (value!.isEmpty) {
                  return ("Please Enter Your Email");
                }
                // reg expression for email validation
                if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                    .hasMatch(value)) {
                  return ("Please Enter a valid email");
                }
                return null;
              },
              onSaved: (value) {
                emailController.text = value!;
              },
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.mail),
                contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                hintText: "Email",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              )),
        ),
        const SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: TextFormField(
              autofocus: false,
              controller: passwordController,
              keyboardType: TextInputType.visiblePassword,
              validator: (value) {
                if (value!.isEmpty) {
                  return ("Please Enter Your password");
                }
                // reg expression for email validation
                if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                    .hasMatch(value)) {
                  return ("Please Enter a valid password");
                }
                return null;
              },
              onSaved: (value) {
                passwordController.text = value!;
              },
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.vpn_key),
                contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                hintText: "Password",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              )),
        ),
        const SizedBox(
          height: 20,
        ),
        ElevatedButton.icon(
          onPressed: () {
            deleteUser(emailController.text, passwordController.text);
          },
          icon: const Icon(Icons.delete),
          label: const Text('Delete Account'),
        ),
      ],
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return _isLoading
        ? Scaffold(
            body: SizedBox(
              height: size.height * .8,
              width: size.width,
              child: Center(
                child: Container(
                    width: 50,
                    height: 50,
                    child: const CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(
                          Color.fromARGB(255, 155, 140, 181)),
                      backgroundColor: Colors.deepPurple,
                    )),
              ),
            ),
          )
        : Scaffold(
            key: _scaffoldKey,
            appBar: AppBar(
              backgroundColor: Color.fromARGB(255, 223, 11, 11),
              title: const Text(
                "Delete Account",
                style: TextStyle(
                  color: Color.fromARGB(255, 254, 253, 253),
                ),
              ),
            ),
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                    'Are you sure you want to delete your account? If you delete it all your data will be ' +
                        'deleted and you must sign up again'),
                SizedBox(
                  height: 50,
                ),
                buildEmailField(),
              ],
            ),
          );
  }

  final FirebaseAuth _auth = FirebaseAuth.instance;
  Future deleteUser(String email, String password) async {
    try {
      setState(() {
        _isLoading = true;
      });
      User user = await _auth.currentUser!;
      AuthCredential credentials =
          EmailAuthProvider.credential(email: email, password: password);
      UserCredential result =
          await user.reauthenticateWithCredential(credentials);
      final CollectionReference userCollection =
          FirebaseFirestore.instance.collection('student');
      await userCollection.doc(user.uid).delete();
      // called from database class
      await result.user!.delete();
      setState(() {
        _isLoading = false;
      });
      Navigator.pushReplacement(context, MaterialPageRoute(
        builder: (context) {
          return LoginScreen();
        },
      ));
      return true;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
