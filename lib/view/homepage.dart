import 'package:demo/view/userData.dart';
import 'package:flutter/material.dart';

import 'Animation.dart';
import 'Navdrawer.dart';
import 'package:firebase_auth/firebase_auth.dart';


class homepage extends StatefulWidget{
  //const homepage({Key? key, required User user}) : super(key: key);
  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage>{
   int _selectedIndex = 0;
  static const TextStyle options = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 25,
  );
  static const List<Widget> _widgetoption = <Widget> [
    Text(
       'home',
       style: options,
    ),
    Text(
        'Animations',
         style: options,
    ),
    Text(
      'Search',
      style: options,
    ),
  ];

  onTapItem(int index){
    setState(() {
      _selectedIndex = index;
      if(index == 0){
        Navigator.push(context, MaterialPageRoute(builder: (context) => userData()));
      }
      else if(index == 1){
        Navigator.push(context, MaterialPageRoute(builder: (context) => const Animations()));
      }
      else if(index == 2){
        //Navigator.push(context, MaterialPageRoute(builder: (context) => trialData()));
        Navigator.pushNamed(context, '/dash');
      }
    });
}


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      drawer: Navdrawer(),
      appBar: AppBar(
        title: const Text("HomePage"),

      ),


      body:  Center(
          child: _widgetoption.elementAt(_selectedIndex),

      ),


      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem> [
          BottomNavigationBarItem(
              icon: Icon(Icons.home_sharp),
            label: 'Home',
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.animation_sharp),
            label: 'Animations',
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.call),
            label: 'Contacts',
          ),


        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blueAccent,
        onTap: onTapItem,
        backgroundColor: Colors.white,
      ),

    );
  }

}