import 'package:demo/view/DashBoard.dart';
import 'package:demo/view/Sign_up.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';


var allRoutes  = <String,WidgetBuilder>{
  //'/home': (context) => homepage(),
  '/sign' : (context) => Sign_up(),
  '/dash' : (context) => Dashboard(),
};
