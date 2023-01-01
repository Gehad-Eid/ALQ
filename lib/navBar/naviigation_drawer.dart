import 'package:alqgp/screens/welcome.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../models/user_model.dart';
import '../screens/chapters.dart';
import '../screens/home.dart';
import '../screens/profile.dart';
import 'drawer_item.dart';

//change the padding a lettel + the text font & color

class NavigationDrawer extends StatefulWidget {
  const NavigationDrawer({super.key});

  @override
  State<NavigationDrawer> createState() => _NavigationDrawerState();
}

class _NavigationDrawerState extends State<NavigationDrawer> {
  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();

  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection("student")
        .doc(user!.uid)
        .get()
        .then((value) {
      this.loggedInUser = UserModel.fromMap(value.data());
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Material(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(24.0, 50, 24, 0),
          child: Column(
            children: [
              headerWidget(),
              const SizedBox(
                height: 40,
              ),
              const Divider(
                thickness: 0,
                height: 10,
                color: Colors.black,
              ),
              const SizedBox(
                height: 20,
              ),
              DrawerItem(
                name: 'Learning',
                icon: Icons.menu_book_outlined,
                onPressed: () => onItemPressed(context, index: 0),
              ),
              const SizedBox(
                height: 15,
              ),
              DrawerItem(
                  name: 'My Profile',
                  icon: Icons.account_box_rounded,
                  onPressed: () => onItemPressed(context, index: 1)),
              const SizedBox(
                height: 20,
              ),
              const Divider(
                thickness: 1,
                height: 10,
                color: Colors.grey,
              ),
              const SizedBox(
                height: 15,
              ),
              DrawerItem(
                  name: 'Setting',
                  icon: Icons.settings,
                  onPressed: () => onItemPressed(context, index: 2)),
              const SizedBox(
                height: 15,
              ),
              DrawerItem(
                name: 'Log out',
                icon: Icons.logout,
                onPressed: () => logout(context),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void onItemPressed(BuildContext context, {required int index}) {
    Navigator.pop(context);

    switch (index) {
      case 0:
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => header()));
        break;
      case 1:
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => ProfileScreen()));
        break;
    }
  }

  Widget headerWidget() {
    const url = 'images/5b8f3d9f30460aeedbe6a235e2d001d3.jpg';
    return Row(
      children: [
        const CircleAvatar(
          radius: 40,
          backgroundImage: AssetImage(url),
        ),
        const SizedBox(
          width: 10,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('${loggedInUser.firstName} ${loggedInUser.secondName}',
                style: TextStyle(fontSize: 20, color: Colors.black)),
            SizedBox(
              height: 10,
            ),
            Text('${loggedInUser.email}',
                style: TextStyle(fontSize: 15, color: Colors.black))
          ],
        )
      ],
    );
  }

  // the logout function
  Future<void> logout(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => WelcomeScreen()));
  }
}






//https://www.youtube.com/watch?v=7r0b4881_o8