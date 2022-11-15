import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

import 'dart:io' as io;
import '../Database/database.dart';
import 'Login_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>  with TickerProviderStateMixin {

  late AnimationController _controller;
  DbHelper dbHelper = DbHelper.instance;
   Database? db;



  @override
  void initState()  {
    initDB();
    super.initState();
    _controller = AnimationController(
        duration: const Duration(seconds:0),
        vsync: this);

  }
  initDB()async{
    db = (await dbHelper.db)!;
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Lottie.network(
        'https://assets9.lottiefiles.com/private_files/lf30_jscf4cci.json',
        controller: _controller,
        height: MediaQuery
            .of(context)
            .size
            .height * 1,
        animate: true,
        onLoaded: (composition) {
          _controller
            ..duration = composition.duration
            ..forward().whenComplete(() =>
                Navigator.pushReplacement(context,
                    MaterialPageRoute(
                        builder: (context) => const MyHomePage(title: '',))
                ));
        },
      ),
    );
  }
}

