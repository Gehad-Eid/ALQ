/*import 'package:alqgp/screens/signup.dart';
import 'package:flutter/material.dart';

import '../consts.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 254, 177, 217),
      appBar: AppBar(
        title: Text("HomePage"),
        backgroundColor: Colors.pinkAccent,
      ),
      //start here
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("images/logo.jpeg", width: 300, height: 500),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    width: 120,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text("Sign In"),
                      style:
                          ElevatedButton.styleFrom(primary: Colors.pinkAccent),
                    )),
                Container(
                    margin: EdgeInsets.only(left: 30),
                    width: 120,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (BuildContext context) {
                          return sign_up();
                        }));
                      },
                      child: Text("Sign Up"),
                      style:
                          ElevatedButton.styleFrom(primary: Colors.pinkAccent),
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
*/
import 'package:alqgp/screens/signup.dart';
import 'package:flutter/material.dart';
import 'package:alqgp/widgets/my_button.dart';

import '../consts.dart';
import 'login.dart';

class WelcomeScreen extends StatefulWidget {
  //prop
  static const String screenRout = 'home';

  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
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
            Column(
              children: [
                Container(
                  height: 180,
                  child: Image.asset('images/logo2.png'),
                ),
                const Text(
                  'ALQ',
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.w900,
                    color: Color(0xff2e386b),
                  ),
                ),
              ],
            ),
            SizedBox(height: 30),
            MyButton(
              color: Color.fromARGB(255, 223, 115, 115),
              title: 'Log in',
              onPressed: () {
                Navigator.pushNamed(context, LoginScreen.screenRout);
              },
            ),
            MyButton(
              color: Color.fromARGB(255, 156, 203, 247),
              title: 'Sign up',
              onPressed: () {
                Navigator.pushNamed(context, RegistrationScreen.screenRout);
                //Navigator.pushNamed(context, sign_up.screenRout);
              },
            )
          ],
        ),
      ),
    );
  }
}
