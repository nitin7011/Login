import 'package:flutter/material.dart';

class Dashdrawer extends StatefulWidget {
  const Dashdrawer({Key? key}) : super(key: key);

  @override
  State<Dashdrawer> createState() => _DashdrawerState();
}

class _DashdrawerState extends State<Dashdrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children:   [
          const DrawerHeader(
            padding: EdgeInsets.all(60.0),
            child:
            Text('HomePage',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
                color: Colors.blueAccent,

              ),
              textAlign: TextAlign.center,

            ),

          ),
          ListTile(
            leading: const Icon(Icons.arrow_forward_ios_rounded),
            title: const Text('Welcome'),
            onTap: () {
              Navigator.of(context).pop();
            },
          ),

          ListTile(
            leading: const Icon(Icons.person_outline_rounded),
            title: const Text('Profile'),
            onTap: () {
              Navigator.of(context).pop();
            },
          ),

          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Feedback'),
            onTap: () => {Navigator.of(context).pop()},
          ),

          ListTile(
            leading: const Icon(Icons.logout_rounded),
            title: const Text('Logout'),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).pop();
            },
          ),

        ],
      ),
    );
  }
}
