import 'package:alqgp/Main/logIn.dart';
import 'package:alqgp/Main/signUp.dart';
import 'package:alqgp/Main/welcome.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';
import 'consts.dart';
import 'package:alqgp/Settings/settings.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart' as sett;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await sett.Settings.init(cacheProvider: SharePreferenceCache());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ValueChangeObserver<bool>(
      cacheKey: setting.darkMoodKey,
      defaultValue: false,
      builder: (_, isDarkMood, __) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'ALQ',
        theme: isDarkMood
            ? ThemeData.dark().copyWith(
                primaryColor: Colors.amber,
                //accentColor: Colors.red,
                scaffoldBackgroundColor: Color.fromARGB(255, 38, 4, 57),
                canvasColor: Color.fromARGB(255, 53, 22, 70),
              )
            : ThemeData.light().copyWith(
                accentColor: Colors.indigo.shade800,
                primaryColor: kTextColor,
                scaffoldBackgroundColor: kBackgroundColor,
                canvasColor: kBackgroundColor,
              ),

        //for testing sign in & up : WelcomeScreen
        //for testing Chapters & profile & whatever else : header
        initialRoute: WelcomeScreen.screenRout,

        routes: {
          //home
          WelcomeScreen.screenRout: (context) => WelcomeScreen(),
          //login
          LoginScreen.screenRout: (context) => const LoginScreen(),
          //signup
          RegistrationScreen.screenRout: (context) =>
              const RegistrationScreen(),
          //profile

          //chapters
          //header.screenRout: (context) => const header(),
          //lessons
          //Lessons.screenRout: (context) => const Lessons(),
        },
      ),
    );
  }
}
