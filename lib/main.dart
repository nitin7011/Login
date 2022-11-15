import 'package:cached_network_image/cached_network_image.dart';
import 'package:demo/util/Authentication.dart';
import 'package:demo/view/splash.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:path/path.dart';
import 'package:firebase_core/firebase_core.dart';


import 'Routes.dart';

void main() {
  /*FirebaseApp firebaseApp = Firebase.initializeApp() as FirebaseApp;*/

  runApp(const MyApp());
}




class MyApp extends StatelessWidget {
  const MyApp({super.key});


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {


    FutureBuilder(
      future: Authentication.initializeFirebase(context: context),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const Text('Error initializing Firebase');
        } else if (snapshot.connectionState == ConnectionState.done) {
          print('firebase initialized');
          //return GoogleSignInButton();
        }
        return const CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(
            Colors.blue,
          ),
        );
      },
    );

    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      //initialRoute: '/',
      routes: allRoutes,
      debugShowCheckedModeBanner: false,
      home:  const SplashScreen(),
    );


  }
}

