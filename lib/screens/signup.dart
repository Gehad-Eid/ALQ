import 'package:alqgp/screens/home.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

class sign_up extends StatefulWidget {
  //prop
  static const String screenRout = 'signup';
  const sign_up({super.key});

  @override
  State<sign_up> createState() => _sign_upState();
}

class _sign_upState extends State<sign_up> {
  TextEditingController fname = TextEditingController();
  TextEditingController lastname = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirm = TextEditingController();

  @override
  void initState() {
    super.initState();
    ToastContext().init(context);
  }

  sign_up() {
    CollectionReference db = FirebaseFirestore.instance.collection("student");
    db.doc().set({
      "FIRST_NAME": fname.text,
      "LAST_NAME": lastname.text,
      "EMAIL": email.text,
      "PASSWORD": password.text,
    }).then((value) {
      Toast.show("Account Registered",
          duration: Toast.lengthShort, gravity: Toast.bottom);
      Navigator.push(context,
          MaterialPageRoute(builder: (BuildContext context) {
        return WelcomeScreen();
      }));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 254, 177, 217),
      appBar: AppBar(
        title: Text("Sign Up"),
        backgroundColor: Colors.pinkAccent,
      ),
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          alignment: Alignment.center,
          child: Center(
            child: Column(
              children: [
                Container(
                    margin: EdgeInsets.only(top: 10),
                    child: Image.asset(
                      "images/logo.jpeg",
                      width: 120,
                      height: 120,
                    )),
                Container(
                  margin: EdgeInsets.only(top: 50),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 100,
                          child: Text(
                            "FIRST NAME :",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.pink),
                              borderRadius: BorderRadius.circular(10)),
                          width: 200,
                          child: TextField(
                            controller: fname,
                            decoration:
                                InputDecoration(hintText: " First Name"),
                          ),
                        )
                      ]),
                ),
                Container(
                  margin: EdgeInsets.only(top: 10),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 100,
                          child: Text(
                            "LAST NAME :",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.pink),
                              borderRadius: BorderRadius.circular(10)),
                          width: 200,
                          child: TextField(
                            controller: lastname,
                            decoration: InputDecoration(hintText: " Last Name"),
                          ),
                        )
                      ]),
                ),
                Container(
                  margin: EdgeInsets.only(top: 10),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 100,
                          child: Text(
                            "EMAIL :",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.pink),
                              borderRadius: BorderRadius.circular(10)),
                          width: 200,
                          child: TextField(
                            controller: email,
                            decoration:
                                InputDecoration(hintText: " Email Address"),
                          ),
                        )
                      ]),
                ),
                Container(
                  margin: EdgeInsets.only(top: 10),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 100,
                          child: Text(
                            "PASSWORD :",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.pink),
                              borderRadius: BorderRadius.circular(10)),
                          width: 200,
                          child: TextField(
                            controller: password,
                            decoration: InputDecoration(hintText: " Password"),
                          ),
                        )
                      ]),
                ),
                Container(
                  margin: EdgeInsets.only(top: 10),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 100,
                          child: Text(
                            "CONFIRM PASSWORD :",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.pink),
                              borderRadius: BorderRadius.circular(10)),
                          width: 200,
                          child: TextField(
                            controller: confirm,
                            decoration:
                                InputDecoration(hintText: " Confirm Password"),
                          ),
                        )
                      ]),
                ),
                Container(
                  margin: EdgeInsets.only(top: 15),
                  width: 150,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      sign_up();
                    },
                    child: Text("Register"),
                    style: ElevatedButton.styleFrom(primary: Colors.pinkAccent),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}


/*
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:alqgp/models/user_model.dart';
import 'package:alqgp/widgets/my_button.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:toast/toast.dart';
import 'chapters.dart';
import 'home.dart';

class RegistrationScreen extends StatefulWidget {
  //prop
  static const String screenRout = 'signup';

  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _auth = FirebaseAuth.instance;

  late String fname;
  late String lname;
  late String email;
  late String pass;

  // string for displaying the error Message
  String? errorMessage;

  // form key
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: 180,
              child: Image.asset('images/logo.jpeg'),
            ),
            SizedBox(height: 50),
            TextFormField(
              //textAlign: TextAlign.center,
              validator: (value) {
                RegExp regex = new RegExp(r'^.{3,}$');
                if (value!.isEmpty) {
                  return ("First Name cannot be Empty");
                }
                if (!regex.hasMatch(value)) {
                  return ("Enter Valid name(Min. 3 Character)");
                }
                return null;
              },
              onChanged: (value) {
                fname = value.trim();
              },
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.account_circle),
                hintText: 'First name',
                contentPadding: EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 20,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.orange,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.blue,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
              ),
            ),
            SizedBox(height: 8),
            TextFormField(
              //textAlign: TextAlign.center,
              validator: (value) {
                if (value!.isEmpty) {
                  return ("Last Name cannot be Empty");
                }
                return null;
              },
              onChanged: (value) {
                lname = value.trim();
              },
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.account_circle),
                hintText: 'Last name',
                contentPadding: EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 20,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.orange,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.blue,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
              ),
            ),
            SizedBox(height: 8),
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              //textAlign: TextAlign.center,
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
              onChanged: (value) {
                email = value.trim();
              },
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.mail),
                hintText: 'Email',
                contentPadding: EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 20,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.orange,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.blue,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
              ),
            ),
            SizedBox(height: 8),
            TextFormField(
              obscureText: true,
              //textAlign: TextAlign.center,
              validator: (value) {
                RegExp regex = new RegExp(r'^.{6,}$');
                if (value!.isEmpty) {
                  return ("Password is required for login");
                }
                if (!regex.hasMatch(value)) {
                  return ("Enter Valid Password(Min. 6 Character)");
                }
              },
              onChanged: (value) {
                pass = value.trim();
              },
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.key),
                hintText: 'Password',
                contentPadding: EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 20,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.orange,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.blue,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
              ),
            ),
            SizedBox(height: 8),
            TextFormField(
              obscureText: true,
              //textAlign: TextAlign.center,
              validator: (value) {
                if (value != pass) {
                  return "Password don't match";
                }
                return null;
              },
              onChanged: (value) {
                //con_pass = value.trim();
              },
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.key),
                hintText: 'Confirem Password',
                contentPadding: EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 20,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.orange,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.blue,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            MyButton(
              color: Colors.blue[800]!,
              title: 'register',
              onPressed: () {
                /*try {
                  final newUser = await _auth.createUserWithEmailAndPassword(
                      email: email, password: pass);
                  Navigator.pushNamed(context, header.screenRout);
                } catch (e) {
                  print(e);
                }*/

                signUp(email, pass);

                /*print(email);
                print(pass);
                print(lname);
                print(fname);*/
              },
            )
          ],
        ),
      ),
    );
  }

  void signUp(String email, String password) async {
    if (_formKey.currentState!.validate()) {
      try {
        await _auth
            .createUserWithEmailAndPassword(email: email, password: password)
            .then((value) => {postDetailsToFirestore()})
            .catchError((e) {
          Fluttertoast.showToast(msg: e!.message);
        });
      } on FirebaseAuthException catch (error) {
        switch (error.code) {
          case "invalid-email":
            errorMessage = "Your email address appears to be malformed.";
            break;
          case "wrong-password":
            errorMessage = "Your password is wrong.";
            break;
          case "user-not-found":
            errorMessage = "User with this email doesn't exist.";
            break;
          case "user-disabled":
            errorMessage = "User with this email has been disabled.";
            break;
          case "too-many-requests":
            errorMessage = "Too many requests";
            break;
          case "operation-not-allowed":
            errorMessage = "Signing in with Email and Password is not enabled.";
            break;
          default:
            errorMessage = "An undefined Error happened.";
        }
        Fluttertoast.showToast(msg: errorMessage!);
        print(error.code);
      }
    }
  }

  postDetailsToFirestore() async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = _auth.currentUser;

    UserModel userModel = UserModel();

    // writing all the values
    userModel.email = user!.email;
    userModel.uid = user.uid;
    userModel.firstName = fname;
    userModel.secondName = lname;

    await firebaseFirestore
        .collection("student")
        .doc(user.uid)
        .set(userModel.toMap());
    Fluttertoast.showToast(msg: "Account created successfully :) ");

    Navigator.pushAndRemoveUntil(
        (context),
        MaterialPageRoute(builder: (context) => WelcomeScreen()),
        (route) => false);
  }
}
*/