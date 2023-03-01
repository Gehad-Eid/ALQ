// import 'package:alqgp/Main/logIn.dart';
// import 'package:alqgp/Main/signUp.dart';
// import 'package:alqgp/Main/welcome.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_settings_screens/flutter_settings_screens.dart';
// import 'consts.dart';
// import 'package:alqgp/Settings/settings.dart';
// import 'package:flutter_settings_screens/flutter_settings_screens.dart' as sett;

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();
//   await sett.Settings.init(cacheProvider: SharePreferenceCache());
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return ValueChangeObserver<bool>(
//       cacheKey: setting.darkMoodKey,
//       defaultValue: false,
//       builder: (_, isDarkMood, __) => MaterialApp(
//         debugShowCheckedModeBanner: false,
//         title: 'ALQ',
//         theme: isDarkMood
//             ? ThemeData.dark().copyWith(
//                 primaryColor: Colors.black,
//                 colorScheme: ColorScheme.dark(),
//                 scaffoldBackgroundColor: Color.fromARGB(255, 38, 4, 57),
//                 primaryColorDark: Color.fromARGB(255, 53, 22, 70),
//                 canvasColor: Color.fromARGB(255, 53, 22, 70),
//               )
//             : ThemeData.light().copyWith(
//                 primaryColor: Colors.blue.shade300,
//                 scaffoldBackgroundColor: kBackgroundColor,
//                 // primaryColorLight: kBackgroundColor,
//                 colorScheme: ColorScheme.light(),
//                 // canvasColor: kBackgroundColor,
//               ),

//         //for testing sign in & up : WelcomeScreen
//         //for testing Chapters & profile & whatever else : header
//         initialRoute: WelcomeScreen.screenRout,

//         routes: {
//           //home
//           WelcomeScreen.screenRout: (context) => WelcomeScreen(),
//           //login
//           LoginScreen.screenRout: (context) => const LoginScreen(),
//           //signup
//           RegistrationScreen.screenRout: (context) =>
//               const RegistrationScreen(),
//           //profile

//           //chapters
//           //header.screenRout: (context) => const header(),
//           //lessons
//           //Lessons.screenRout: (context) => const Lessons(),
//         },
//       ),
//     );
//   }
// }

import 'package:alqgp/Screens/splash.dart';
import 'package:alqgp/Screens/wrapper.dart';
import 'package:alqgp/Services/auth.dart';
import 'package:alqgp/models/user_model.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of the application.
  @override
  Widget build(BuildContext context) {
    //Stream Provider keeps listening to the changes
    //on the user in the database through the app.
    return StreamProvider<UserModel?>.value(
      value: AuthService().user,
      initialData: null,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(brightness: Brightness.light),
        darkTheme: ThemeData(brightness: Brightness.dark),
        themeMode: ThemeMode.system,
        // kick off with the splash screen.
        home: SplashPage(),
      ),
    );
  }
}
