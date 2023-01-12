import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';
import '../screens/home.dart';

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
              changePass(),
              const SizedBox(height: 2),
              deleteAccount(),
            ],
          ),
          const SizedBox(height: 32),
          SettingsGroup(
            title: 'Feedback',
            children: <Widget>[
              const SizedBox(height: 8),
              aboutUs(),
              const SizedBox(height: 2),
              reportBug(),
              const SizedBox(height: 2),
              sendFeedback(),
              const SizedBox(height: 2),
              faq(),
            ],
          ),
          const SizedBox(height: 16),
          SettingsGroup(
            title: '',
            children: <Widget>[
              const SizedBox(height: 8),
              // resetSettings(),
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
  Widget deleteAccount() => SimpleSettingsTile(
        title: 'Delete Account',
        subtitle: '',
        leading: const CustomIcon(
            icon: Icons.delete_forever_rounded, color: Colors.red),
        //onTap: () => Utils.showSnackBar(context),
      );
  Widget reportBug() => SimpleSettingsTile(
        title: 'Report A Bug',
        subtitle: '',
        leading: const CustomIcon(icon: Icons.bug_report, color: Colors.teal),
        //onTap: () => Utils.showSnackBar(context),
      );
  Widget sendFeedback() => SimpleSettingsTile(
        title: 'Send Feedback',
        subtitle: '',
        leading: const CustomIcon(
            icon: Icons.thumbs_up_down_rounded, color: Colors.deepPurpleAccent),
        //onTap: () => Utils.showSnackBar(context),
      );
  Widget changePass() => SimpleSettingsTile(
        //TextInputSettingsTile
        title: 'Change Password',
        subtitle: '',
        leading: const CustomIcon(
            icon: Icons.password_rounded, color: Colors.blueAccent),
        //onTap: () => Utils.showSnackBar(context),
      );
  Widget aboutUs() => SimpleSettingsTile(
        //TextInputSettingsTile
        title: 'About Us',
        subtitle: '',
        leading:
            const CustomIcon(icon: Icons.campaign_rounded, color: Colors.lime),
        //onTap: () => Utils.showSnackBar(context),
      );
  Widget faq() => SimpleSettingsTile(
        //TextInputSettingsTile
        title: 'FAQ',
        subtitle: '',
        leading: CustomIcon(
            icon: Icons.question_answer_outlined, color: Colors.pink.shade200),
        //onTap: () => Utils.showSnackBar(context),
      );
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

  Future<void> logingout(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => WelcomeScreen()));
  }
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
