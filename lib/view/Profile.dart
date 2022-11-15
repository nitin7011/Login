import 'dart:math';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'package:shared_preferences/shared_preferences.dart';

import '../Database/database.dart';
import '../util/sharedPref.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  late  TextEditingController _controlText = TextEditingController();
  @override
  void initState() {
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
      // await ImageShare.loadImagePrefs();
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
        image = imageString;
        //  image = ImageShare.imageFrom64BaseString(imageString!);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    //var name = 'rahul';
    String res1;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.lightBlue,
        title: const Text(
          'Profile',
          style: TextStyle(
            fontSize: 20,
            //fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Center(
            child: Column(
              children: [
                Stack(children: [
                  SizedBox(
                    width: 130,
                    height: 100,
                    child: TextButton(
                      onPressed: () {
                        // res1 = await name();
                        //print("profile data is: $res1");
                      },
                      child: ClipOval(

                        //borderRadius: BorderRadius.circular(100.0),
                        child:  Image.network('https://cdn-icons-png.flaticon.com/512/3177/3177440.png',
                            width: 100,
                            height: 100,),
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
                  ),
                  SizedBox(
                    width: 110,
                    height: 110,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 70.0, top: 70.0),
                      child: FloatingActionButton(
                        onPressed: () {
                          showModalBottomSheet(
                              context: context,
                              builder: (BuildContext context) {
                                return SafeArea(
                                    child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    ListTile(
                                      leading:
                                          const Icon(Icons.camera_alt_outlined),
                                      title: const Text('Camera'),
                                      onTap: () {
                                        getImage(ImageSource.camera);
                                        Navigator.pop(context);
                                      },
                                    ),
                                    ListTile(
                                      leading: const Icon(Icons.image),
                                      title: const Text('Gallery'),
                                      onTap: () {
                                        getImage(ImageSource.gallery);
                                        Navigator.pop(context);
                                      },
                                    )
                                  ],
                                ));
                              });
                        },
                        child: const Icon(Icons.add_photo_alternate),
                        backgroundColor: Colors.lightBlueAccent,
                      ),
                    ),
                  ),
                ]),
                Padding(
                  padding: const EdgeInsets.only(top: 30.0),
                  child: SizedBox(
                    width: 350,
                    height: 60,
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          var res1 = name();
                          print("Email="+res1.toString());
                          _controlText.text = res1 ;
                        });
                      },
                      child: TextField(
                          controller: _controlText,

                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: SizedBox(
                    width: 350,
                    height: 60,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[100],
                        border: Border.all(
                          color: Colors.white,
                        ),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(18.0)),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.only(left: 20.0, top: 20.0),
                        child: Text('Rahul'),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: SizedBox(
                    width: 350,
                    height: 60,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[100],
                        border: Border.all(
                          color: Colors.white,
                        ),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(18.0)),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.only(left: 20.0, top: 20.0),
                        child: Text('7854784785'),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  name() async {
    DbHelper dbHelper = DbHelper.instance;
    var res = await dbHelper.getDetail();
    print("Method result $res");
    return res;
  }
}
