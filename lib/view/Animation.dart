
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Animations extends StatefulWidget {
  const Animations({Key? key}) : super(key: key);

  @override
  State<Animations> createState() => _AnimationsState();
}

class _AnimationsState extends State<Animations>  with SingleTickerProviderStateMixin {

  double height = 200;
  double width = 200;
  Color color = Colors.red;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Animations',
        ),
        centerTitle: true,
      ),
      body: Center(
        child: AnimatedContainer(
          width: width,
          height: height,
          decoration: BoxDecoration(
            color: color,
                borderRadius: BorderRadius.circular(20),
          ), duration: Duration(milliseconds: 800),
          curve: Curves.bounceIn,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          setState(() {
            width = width == 300?250:300;
            height = height == 250?300:300;
            color = (color == Colors.blueAccent?
                Colors.blueGrey:Colors.blue[200])!;
          });
        },
        child: const Icon(Icons.change_circle),
      ),

    );
  }
}
