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

  bool isPassword = true;
  
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
          child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Enter yuor Email',
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
              ),
              ),
          ],
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child:  Column(
            crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Enter your password',
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
              keyboardType: TextInputType.visiblePassword,
              obscureText: isPassword,
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
                prefixIcon: const Icon(Icons.vpn_key),
                contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                hintText: "Password",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              )),
          ],
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        ElevatedButton.icon(
          onPressed: () {
            showDialog(
              context: context,
              builder: (con) {
                return AlertDialog(
                  title: Text(
                    'Are you sure you want to delete your account ?',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 18, height: 1.4,fontWeight: FontWeight.bold,color:Color.fromARGB(255, 129, 127, 127)),
                    ),
                  actions: [
                    InkWell(
                      onTap: () {
                        Navigator.pop(con);
                      },
                      child: Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Color(0xFF8EA3E2),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Text(
                          'cancel',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        deleteUser(
                            emailController.text, passwordController.text);
                        Navigator.pop(con);
                      },
                      child: Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Text(
                          'delete',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                );
              },
            );
          },
          style: ElevatedButton.styleFrom(backgroundColor: Color.fromARGB(255, 165, 101, 234),),
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
              title: const Text(
                "Delete Account",
                style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                ),
              elevation: 0,
              centerTitle: true,
              //backgroundColor: Colors.transparent,
              backgroundColor: Color(0xFF8EA3E2),
              // leading: IconButton(
              //   onPressed: () => Navigator.pop(context),
              //   icon: const Icon(
              //     Icons.arrow_back,
              //     size: 30.0,
              //     color: Colors.black,
              //   ),
              // ),
            ),
            // body: Column(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: <Widget>[
            //     Text(' When you delete account your data will be ' +
            //         'deleted and you must sign up again'),
            //     SizedBox(
            //       height: 50,
            //     ),
            //     buildEmailField(),
            //   ],
            // ),
            body :SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.center,
              //to center
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Column(
                  children: [
                    const SizedBox(height: 48),
                    buildAbout(),
                    buildEmailField(),
                    ],
                  ),
                ],
              ),
            ),
          );
  }
Widget buildAbout() => Container(
        padding: EdgeInsets.symmetric(horizontal: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '        Delete your account',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold,color: Color.fromARGB(255, 165, 101, 234),),
            ),
            const SizedBox(height: 20,),
            Text(
              "When you delete your account your data will be deleted and you must sign up again",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18, height: 1.4,fontWeight: FontWeight.bold,color:Color(0xFF8EA3E2).withOpacity(0.75),),
            ),
            const SizedBox(height: 50,),
          ],
        ),
      );


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
