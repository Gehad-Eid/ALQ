import 'package:alqgp/Main/welcome.dart';
import 'package:alqgp/Settings/tts_settings.dart';
import 'package:alqgp/feedBack/AboutUss.dart';
import 'package:alqgp/feedBack/sendffeedback.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';
import 'package:alqgp/Settings/delete_account.dart';
import '../feedBack/FAQQ.dart';
import '../feedBack/ReportABugg.dart';
import 'change_password.dart';

class setting extends StatelessWidget {
  static const darkMoodKey = 'key-dark-mood';
  const setting({super.key});

  @override
  Widget build(BuildContext context) {
    final BuildContext path = context;
    return Scaffold(
      //backgroundColor: Color.fromARGB(255, 243, 247, 248),
      appBar: AppBar(
        elevation: 0,
        title: const Text(
          'Settings',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 243, 247, 248),
      ),
      body: SafeArea(
        child: ListView(padding: const EdgeInsets.all(25.0), children: [
          // SettingsGroup(
          //   title: '',
          //   children: <Widget>[
          //     const SizedBox(height: 8),
          //     darkMood(),
          //   ],
          // ),
          // const SizedBox(height: 32),
          SettingsGroup(
            title: 'GENERAL',
            children: <Widget>[
              const SizedBox(height: 8),
              darkMood(),
              const SizedBox(height: 2),
              changePass(context),
              const SizedBox(height: 2),
              deleteAccount(context),
            ],
          ),
          const SizedBox(height: 32),
          SettingsGroup(
            title: 'Feedback',
            children: <Widget>[
              const SizedBox(height: 8),
              aboutUs(path),
              const SizedBox(height: 2),
              reportBug(path),
              const SizedBox(height: 2),
              sendFeedback(path),
              const SizedBox(height: 2),
              faq(path),
            ],
          ),
          const SizedBox(height: 16),
          SettingsGroup(
            title: '',
            children: <Widget>[
              const SizedBox(height: 8),
              // resetSettings(),
              // const SizedBox(height: 2),
              // tts_Setting(path),
              // const SizedBox(height: 2),
              logout(path),
            ],
          ),
        ]),
      ),
    );
  }

  Widget logout(BuildContext path) => SimpleSettingsTile(
        title: 'Logout',
        subtitle: '',
        leading:
            const CustomIcon(icon: Icons.logout_rounded, color: Colors.grey),
        onTap: () => logingout(path),
      );
  Widget deleteAccount(context) => SimpleSettingsTile(
        title: 'Delete Account',
        subtitle: '',
        leading: const CustomIcon(
            icon: Icons.delete_forever_rounded, color: Colors.red),
        onTap: () {
          Navigator.push(context, MaterialPageRoute(
            builder: (context) {
              return DeleteAcc();
            },
          ));
        },
        //onTap: () => Utils.showSnackBar(context),
      );
  Widget reportBug(BuildContext context) => SimpleSettingsTile(
      title: 'Report A Bug',
      subtitle: '',
      leading: const CustomIcon(icon: Icons.bug_report, color: Colors.teal),
      onTap: () => {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => reportABugg())),
          });
  Widget sendFeedback(BuildContext context) => SimpleSettingsTile(
      title: 'Send Feedback',
      subtitle: '',
      leading: CustomIcon(
          icon: Icons.thumbs_up_down_rounded, color: Colors.deepPurpleAccent),
      onTap: () => {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => sendffeedback())),
          });
  Widget changePass(context) => SimpleSettingsTile(
        //TextInputSettingsTile
        title: 'Change Password',
        subtitle: '',
        leading: const CustomIcon(
            icon: Icons.password_rounded, color: Colors.blueAccent),
        onTap: () {
          Navigator.push(context, MaterialPageRoute(
            builder: (context) {
              return DeleteAcc();
            },
          ));
        },
        //onTap: () => Utils.showSnackBar(context),
      );
  Widget aboutUs(BuildContext context) => SimpleSettingsTile(
      //TextInputSettingsTile
      title: 'About Us',
      subtitle: '',
      leading:
          const CustomIcon(icon: Icons.campaign_rounded, color: Colors.lime),
      onTap: () => {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => aboutUss())),
          });
  Widget faq(BuildContext context) => SimpleSettingsTile(
      //TextInputSettingsTile
      title: 'FAQ',
      subtitle: '',
      leading: CustomIcon(
          icon: Icons.question_answer_outlined, color: Colors.pink.shade200),
      onTap: () => {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => FAQQ())),
          });
  Widget darkMood() => SwitchSettingsTile(
        settingKey: darkMoodKey,
        title: 'Dark Mood',
        leading: CustomIcon(
            icon: Icons.brightness_medium_outlined,
            color: Colors.deepPurple.shade800),
        //onTap: () => Utils.showSnackBar(context),
      );
  // Widget resetSettings() => SimpleSettingsTile(
  //       //TextInputSettingsTile
  //       title: 'Reset Settings',
  //       subtitle: '',
  //       leading: CustomIcon(
  //           icon: Icons.refresh_outlined, color: Colors.deepOrange.shade300),
  //       onTap: () {
  //         Settings.clearCache();
  //       },
  //     );
  // Widget tts_Setting(BuildContext path) => SimpleSettingsTile(
  //       //TextInputSettingsTile
  //       title: 'tts',
  //       subtitle: '',
  //       leading: CustomIcon(
  //           icon: Icons.refresh_outlined, color: Colors.deepOrange.shade300),
  //       onTap: () {
  //         Navigator.of(path)
  //             .push(MaterialPageRoute(builder: (context) => ttsSetting()));
  //       },
  //     );

  Future<void> logingout(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => WelcomeScreen()));
  }

  // Future<void> abouttUs(BuildContext context) async {
  //   await FirebaseAuth.instance.signOut();
  //   Navigator.of(context).pushReplacement(
  //       MaterialPageRoute(builder: (context) => aboutUss(context)));
  // }

  // Future<void> senddFeedback(BuildContext context) async {
  //   await FirebaseAuth.instance.signOut();
  //   Navigator.of(context).pushReplacement(
  //       MaterialPageRoute(builder: (context) => sendffeedback(context)));
  // }

  // Future<void> ffaq(BuildContext context) async {
  //   await FirebaseAuth.instance.signOut();
  //   Navigator.of(context).pushReplacement(
  //       MaterialPageRoute(builder: (context) => FAQQ(context)));
  // }

  // Future<void> rreportABug(BuildContext context) async {
  //   await FirebaseAuth.instance.signOut();
  //   Navigator.of(context).pushReplacement(
  //       MaterialPageRoute(builder: (context) => reportABugg(context)));
  // }
}

class CustomIcon extends StatelessWidget {
  final IconData icon;
  final Color color;
  const CustomIcon({super.key, required this.icon, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(6),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
      ),
      child: Icon(icon, color: Colors.white),
    );
  }
}


 //onTap: () => Utils.showSnackBar(context),
        // onTap: () {
        //   Navigator.push(
        //     context,
        //     MaterialPageRoute(
        //       builder: (context) =>const aboutUs()
        //     )
        //   );
        // },
        // onTap: () {
        //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        //     content: const Text('snack'),
        //     duration: const Duration(seconds: 1),
        //     action: SnackBarAction(
        //       label: 'ACTION',
        //       onPressed: () {
        //         Navigator.push(
        //           context,
        //           MaterialPageRoute(builder: (context) =>  aboutUs()),
        //         );
        //       },
        //     ),
        //   ));
        // },