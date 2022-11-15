import 'package:demo/view/welcome.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:io';
import '../util/Authentication.dart';
import '../util/sharedPref.dart';
import 'Profile.dart';
import 'Task Manager.dart';

class Navdrawer extends StatefulWidget {
  @override
  State<Navdrawer> createState() => _NavdrawerState();
}

class _NavdrawerState extends State<Navdrawer> {
  @override
  void initState(){

    loadImageFromPrefs();
    super.initState();
  }

  String? image;
  final picker = ImagePicker();

  getImage(ImageSource source) async {
    final pickedImage = await picker.getImage(source: source);
    if (pickedImage != null) {
      File file = File(pickedImage.path);
      setState(() {
        /*  image = Image.file(file);*/
      });
      await ImageShare.saveImagePrefs(file.path);
    } else {
      print('No image Selected');
    }
  }

  loadImageFromPrefs() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    final imagekey = preferences.getString(IMAGE_KEY);
    if (imagekey != null) {
      final imageString = await ImageShare.loadImagePrefs();
      print("Imageurl=" + imageString.toString());
      setState(() {
        image = imageString!;
        //  /image = ImageShare.imageFrom64BaseString(imageString!);
      });
    }
  }
  String text = 'Name';
  String text1 = 'email';
  @override
  Widget build(BuildContext context) {

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            padding: const EdgeInsets.all(0.0),
            child: Column(
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Profile()));
                  },
                  child: ClipOval(
                    child: Image.network(
                      'https://cdn-icons-png.flaticon.com/512/3177/3177440.png',
                      width: 40,
                      height: 40,
                    ),

                    /*(image!.isEmpty)
                        ? Image.network(
                            'https://cdn-icons-png.flaticon.com/512/3177/3177440.png',
                            width: 100,
                            height: 100,
                          )
                        : Image.file(
                            File(image!),
                            width: 85,
                            height: 100,
                            fit: BoxFit.cover,
                          ),*/
                  ),
                ),

                TextButton(

                  onPressed: () async {
                    User? user = await Authentication.signInWithGoogle(context: context);
                    var name = user?.displayName;
                    text = name!;
                  },
                  child: Text(text),
                ),

                TextButton(
                  onPressed: () async {
                    User? user = await Authentication.signInWithGoogle(context: context);
                    var email = user?.email;
                    text1 = email!;
                  },
                  child: Text(text1),
                ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.arrow_forward_ios_rounded),
            title: const Text('Welcome'),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Welcome()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.person_outline_rounded),
            title: const Text('Profile'),
            onTap: () {
              //Navigator.of(context).pop();
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Profile()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Feedback'),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            leading: const Icon(Icons.verified_user_rounded),
            title: const Text('Task Manager'),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const TaskManager() ));
            },
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
