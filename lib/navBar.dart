import 'package:flutter/material.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text("name"),
            accountEmail: Text("email@yahoo.com"),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: Image.asset(
                  'images/5b8f3d9f30460aeedbe6a235e2d001d3.jpg',
                  width: 101,
                  height: 101,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            decoration: const BoxDecoration(
                color: Colors.blue,
                image: DecorationImage(
                    image: AssetImage(
                      'images/5f019d0ef53d77bef3461547d2384a2d.png',
                    ),
                    fit: BoxFit.cover)),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text("Home"),
            onTap: () => print("home"),
          ),
          ListTile(
            leading: Icon(Icons.account_circle),
            title: Text("Profile"),
            onTap: () => print("Profile"),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text("Settings"),
            onTap: () => print("settings"),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text("Logout"),
            onTap: () => print("logout"),
          ),
        ],
      ),
    );
  }
}
