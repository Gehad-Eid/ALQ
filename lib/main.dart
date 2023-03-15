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

import 'package:alqgp/Src/Screens/splash.dart';
import 'package:alqgp/Src/Services/auth_repo.dart';
import 'package:alqgp/Src/Utils/Theme/theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp()
      .then((value) => Get.put(AuthenticationRepository()));
  runApp(MyApp());
}

// File structure :
// controllers - the logic of the named screens
//

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    //Stream Provider keeps listening to the changes
    //on the user in the database through the app.
    return
        // StreamProvider<UserModel?>.value(
        //   value: AuthService().user,
        //   initialData: null,
        //   //To keep code clean, manageable, and readable,
        //   //  we are using GETX State management
        //   //  to follow the seperation of concern principle.
        //   child:
        GetMaterialApp(
      debugShowCheckedModeBanner: false,

      //by default the theme will ba as the system's theme
      theme: TAppTheme.lightTheme,
      darkTheme: TAppTheme.darkTheme,
      themeMode: ThemeMode.light,

      //transiition
      defaultTransition: Transition.cupertino, //********** change
      transitionDuration: const Duration(milliseconds: 500),

      // kick off with the splash screen.
      home: SplashScreen(),
      // ),
    );
  }
}
