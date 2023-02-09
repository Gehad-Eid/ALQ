import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import "package:flutter/material.dart";

class ForgetPassword extends StatefulWidget {
  @override
  _ForgetPasswordState createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  void initState() {
    super.initState();
  }

  Widget buildEmailField() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
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
                prefixIcon: Icon(Icons.mail),
                contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                hintText: "Email",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              )),
        ),
        SizedBox(
          height: 20,
        ),
        ElevatedButton.icon(
          onPressed: () {
            resetPassword();
          },
          style: ElevatedButton.styleFrom(backgroundColor: Color(0xFF8EA3E2)),
          icon: Icon(Icons.lock_reset),
          label: Text('Reset password'),
          
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
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
              title: const Text(
                "Reset Password",
                style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                ),
              elevation: 0,
              centerTitle: true,
              backgroundColor: Color(0xFF8EA3E2),
            ),
      body: SingleChildScrollView(
      child: Column(
        //mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 150,),
                Text(
                  "Don't worry if you forgot your password, we will help you so that you can recover it !",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20, height: 1.4,fontWeight: FontWeight.bold,color:Color.fromARGB(155, 165, 71, 197),),
                ),
                const SizedBox(height: 10,),
                Text(
                    "Enter your email to receive a message and reset your password",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16, height: 1.4,fontWeight: FontWeight.bold,color:Color(0xFF8EA3E2)),
                  ),
                  //const SizedBox(height: 10,),
              ],
              ),
          ),
          buildEmailField(),
          // Text('Enter your email to receive a message and reset your password'),
          // SizedBox(
          //   height: 50,
          // ),
          // const SizedBox(height: 15,),
        ],
      ),
    ),
    );
  }

  Future resetPassword() async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => Center(
        child: CircularProgressIndicator(),
      ),
    );
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: emailController.text.trim());
      Navigator.of(context).popUntil((route) => route.isFirst);
    } catch (e) {
      Navigator.pop(context);
      print(e);
    }
  }
}
