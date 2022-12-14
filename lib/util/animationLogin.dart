import 'package:flutter/material.dart';

class LoginAnim extends PageRouteBuilder{
  final Widget page;
  LoginAnim({required this.page})
      : super(
      pageBuilder: (
          BuildContext context,
          Animation<double> animation,
          Animation<double> secondaryAnimation,
          ) => page,
      transitionDuration: const Duration(seconds: 1),
      transitionsBuilder: (
          BuildContext context,
          Animation<double> animation,
          Animation<double> secondaryAnimation,
          Widget child,
          ) =>
          ScaleTransition(
            scale: Tween<double> (
              begin:0.0 ,
              end: 1.0,
            ).animate(
              CurvedAnimation(
                  parent: animation,
                  curve: Curves.easeInOutCirc
              ),
            ),
            child: child,
          )
  );


}