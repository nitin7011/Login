import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'DashDrawer.dart';


class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _StateDash();
}

class _StateDash extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      drawer: Dashdrawer(),
      appBar: AppBar(
        title: const Text(' '),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Center(
            child: Column(
              children: [
                ///Name container
                const Padding(padding: EdgeInsets.all(2.0)),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: const [
                      Padding(padding: EdgeInsets.only(left: 25.0)),
                      SizedBox(
                        height: 50,
                        width: 50,
                        child: CircleAvatar(
                          backgroundColor: CupertinoColors.systemGrey2,
                          backgroundImage: NetworkImage(
                              'https://images.unsplash.com/photo-1506794778202-cad84cf45f1d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8cmFuZG9tJTIwcGVvcGxlfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60'),
                          radius: 100,
                        ),
                      ),
                      Padding(padding: EdgeInsets.only(left: 25.0)),
                      Text(
                        'Hello, John Doe',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ],
                  ),
                ),
                const Padding(padding: EdgeInsets.all(8.0)),
                SizedBox(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(left: 25.0),
                        child: Text(
                          '100',
                          style: TextStyle(color: Colors.white, fontSize: 45),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 30.0, top: 30.0),
                        child: Text(
                          'KARMA \nPOINTS',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      const Padding(padding: EdgeInsets.only(left: 70.0)),
                      SizedBox(
                        width: 120,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/dash');
                          },
                          style: ButtonStyle(
                            shape: MaterialStatePropertyAll(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0)),
                            ),
                            backgroundColor:
                                const MaterialStatePropertyAll<Color>(
                                    Colors.white),
                          ),
                          child: const Text(
                            'Update Profile',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(padding: EdgeInsets.all(10.0)),

                ///Boxes Container
                Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(
                          20.0,
                        ),
                        topRight: Radius.circular(20.0)),
                    color: Colors.white,
                  ),
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        width: 150,
                        height: 120,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.0),
                            color: Colors.green),
                        //padding: const EdgeInsets.only(right: 10.0,top: 10.0),
                        child: Stack(
                          children: const [
                            Positioned(
                                left: 10,
                                top: 5,
                                child: Icon(Icons.shopping_bag_outlined,color: Colors.white,)),
                            Padding(
                              padding: EdgeInsets.only(left: 60.0, top: 8.0),
                              child: Text(
                                'Completed \nAPKs \n 20',
                                textAlign: TextAlign.end,
                                style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: 150,
                        height: 120,

                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          color: Colors.red,
                        ),
                        //padding: const EdgeInsets.only(right: 10.0,top: 10.0),

                        child: Stack(
                          children: const [
                            Positioned(
                                left: 10,
                                top: 5,
                                child: Icon(Icons.shopping_bag_outlined,color: Colors.white,)),
                            Padding(
                              padding: EdgeInsets.only(left: 60.0, top: 8.0),
                              child: Text(
                                'Completed \nopportunitie\ns\n20',
                                textAlign: TextAlign.end,
                                style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                ///second boxes
                Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                  ),
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            width: 150,
                            height: 120,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15.0),
                                color: Colors.indigo[900]),
                            //padding: const EdgeInsets.only(right: 10.0,top: 10.0),
                            child: Stack(
                              children: const [
                                Positioned(
                                    left: 10,
                                    top: 5,
                                    child: Icon(Icons.watch_later_outlined,color: Colors.white,)),
                                Padding(
                                  padding:
                                      EdgeInsets.only(left: 80.0, top: 8.0),
                                  child: Text(
                                    'Time \nDonated \n 100h',
                                    textAlign: TextAlign.end,
                                    style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: 150,
                            height: 120,

                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15.0),
                              color: Colors.blue[700],
                            ),
                            //padding: const EdgeInsets.only(right: 10.0,top: 10.0),

                            child: Stack(
                              children: const [
                                Positioned(
                                    left: 10,
                                    top: 5,
                                    child:
                                        Icon(Icons.monetization_on_outlined,color: Colors.white,)),
                                Padding(
                                  padding:
                                      EdgeInsets.only(left: 90.0, top: 8.0),
                                  child: Text(
                                    'Money \nSaved\ns\n5,000',
                                    textAlign: TextAlign.end,
                                    style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const Padding(padding: EdgeInsets.all(15.0)),
                      ///LeaderBoard Container
                      Column(
                        children: [
                          Container(
                            color: Colors.grey[100],
                            //height: 100,
                            width: 320,
                            height: 450,
                            child: Stack(
                              children: [
                                Positioned(
                                    right: 10,
                                    top: 5,
                                    child: Image.network(
                                      'https://cdn-icons-png.flaticon.com/512/4525/4525694.png',
                                      width: 80,
                                      height: 80,
                                    )),
                                const Padding(
                                  padding:
                                      EdgeInsets.only(left: 25.0, top: 30.0),
                                  child: Text(
                                    'L E A D E R  B O A R D',
                                    textAlign: TextAlign.end,
                                    style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.blue,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                const Padding(
                                  padding:
                                      EdgeInsets.only(top: 55.0, left: 25.0),
                                  child: Text(
                                    'You are on 3rd place\namongst other volunteers',
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 18),
                                  ),
                                ),

                                ///Name of winner
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 120.0, left: 25),
                                  child: Container(
                                    width: 270,
                                    color: Colors.white,
                                    child: Stack(
                                      children: [
                                        Positioned(
                                            right: 0,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Image.network(
                                                'https://cdn-icons-png.flaticon.com/512/179/179349.png',
                                                width: 30,
                                                height: 30,
                                              ),
                                            )),
                                        const Padding(
                                          padding: EdgeInsets.all(10.0),
                                          child: Text(
                                            'Clifford CLuster',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 20),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),

                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 180.0, left: 25),
                                  child: Container(
                                    width: 270,
                                    color: Colors.white,
                                    child: Stack(
                                      children: [
                                        Positioned(
                                            right: 0,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Image.network(
                                                'https://cdn-icons-png.flaticon.com/512/179/179350.png',
                                                width: 30,
                                                height: 30,
                                              ),
                                            )),
                                        const Padding(
                                          padding: EdgeInsets.all(10.0),
                                          child: Text(
                                            'Blanche Borton',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 20),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),

                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 240.0, left: 25),
                                  child: Container(
                                    width: 270,
                                    color: Colors.white,
                                    child: Stack(
                                      children: [
                                        Positioned(
                                            right: 0,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Image.network(
                                                'https://cdn-icons-png.flaticon.com/512/179/179351.png',
                                                width: 30,
                                                height: 30,
                                              ),
                                            )),
                                        const Padding(
                                          padding: EdgeInsets.all(10.0),
                                          child: Text(
                                            'You',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 20),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),

                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 300.0, left: 25),
                                  child: Container(
                                    width: 270,
                                    color: Colors.white,
                                    child: Stack(
                                      children: [
                                        Positioned(
                                            right: 0,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Image.network(
                                                'https://cdn-icons-png.flaticon.com/512/179/179352.png',
                                                width: 30,
                                                height: 30,
                                              ),
                                            )),
                                        const Padding(
                                          padding: EdgeInsets.all(10.0),
                                          child: Text(
                                            'Susan Martin',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 20),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),

                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 360.0, left: 25),
                                  child: Container(
                                    width: 270,
                                    color: Colors.white,
                                    child: Stack(
                                      children: [
                                        Positioned(
                                            right: 0,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Image.network(
                                                'https://cdn-icons-png.flaticon.com/512/179/179357.png',
                                                width: 30,
                                                height: 30,
                                              ),
                                            )),
                                        const Padding(
                                          padding: EdgeInsets.all(10.0),
                                          child: Text(
                                            'Issac Hughes',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 20),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),




                              ],
                            ),
                          ),
                        ],
                      ),
                      ///Second Last Container
                      Padding(padding: EdgeInsets.all(10.0)),
                      Container(
                        height: 130,
                          width: 320,
                          color: Colors.grey[100],
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10.0,right: 10.0,top: 5.0),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children:  [
                                  const Text('SDGs Impacted',style: TextStyle(color: Colors.black,fontSize: 18),textAlign: TextAlign.end,),
                                  TextButton(
                                    onPressed: () {
                                      print('tapped');
                                    },
                                    child: const Text(
                                      'View\nAll',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 15,

                                      ),
                                      textAlign: TextAlign.end,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children:[
                              Image.network('https://thumbs.dreamstime.com/b/no-poverty-color-icon-corporate-social-responsibility-sustainable-development-goals-sdg-sign-pictogram-ad-web-mobile-app-promo-167190533.jpg',width: 50,height: 50,),
                              const Padding(padding: EdgeInsets.all(5.0)),
                              Image.network('https://upload.wikimedia.org/wikipedia/commons/c/c4/Sustainable_Development_Goal_3.png',width: 50,height: 50,),
                                  const Padding(padding: EdgeInsets.all(5.0)),
                              Image.network('https://upload.wikimedia.org/wikipedia/commons/6/68/Sustainable_Development_Goal_16.png',width: 50,height: 50,),

                                ]
                              )
                            ],
                          ),

                        ),
                      ),
                      ///Last container
                      Padding(padding: EdgeInsets.all(10.0)),
                      Container(
                        //height: 300,
                        width: 320,

                        color: Colors.grey[100],
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10.0,right: 10.0,top: 10.0),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  SizedBox(
                                    width: 120,
                                    child: ElevatedButton(
                                      onPressed: () {
                                        Navigator.pushNamed(context, '/dash');
                                      },
                                      style: ButtonStyle(
                                        shape: MaterialStatePropertyAll(
                                          RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(20.0)),
                                        ),
                                        backgroundColor:
                                         MaterialStatePropertyAll<Color>(
                                            Colors.blue[100]!),
                                      ),
                                      child: const Text(
                                        'My ARKs',
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                  ),

                                  SizedBox(
                                    width: 120,
                                    child: ElevatedButton(
                                      onPressed: () {
                                        Navigator.pushNamed(context, '/dash');
                                      },
                                      style: ButtonStyle(
                                        shape: MaterialStatePropertyAll(
                                          RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(20.0)),
                                        ),
                                        backgroundColor:
                                         MaterialStatePropertyAll<Color>(
                                            Colors.blue[600]!),
                                      ),
                                      child: const Text(
                                        'My Opportunities',
                                        style: TextStyle(
                                          fontSize: 10,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),



                                ],
                              ),

                              ///last column
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children:  [
                                  const Text('Current Opportunities',style: TextStyle(color: Colors.black,fontSize: 18),textAlign: TextAlign.end,),
                                  TextButton(
                                    onPressed: () {
                                      print('tapped');
                                    },
                                    child: const Text(
                                      'View\nAll',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 15,

                                      ),
                                      textAlign: TextAlign.end,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children:[
                                     Image.network('https://northstarinnovations.in/wp-content/uploads/2020/11/Mobile-App.png',width: 80,height: 80,),
                                      const Padding(
                                        padding: EdgeInsets.only(left: 25.0),
                                        child: Text('Volunteer required to\ncreate an application on\n03 sep,2020 ',style: TextStyle(color: Colors.black),),
                                      ),
                                  ]
                              ),
                              Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children:[
                                    Image.network('https://northstarinnovations.in/wp-content/uploads/2020/11/Mobile-App.png',width: 80,height: 80,),
                                    const Padding(
                                      padding: EdgeInsets.only(left: 25.0),
                                      child: Text('Volunteer as a content\nwriter for social media \n07 sep,2020 ',style: TextStyle(color: Colors.black),),
                                    ),
                                  ]
                              ),
                            ],
                          ),

                        ),
                      ),
                    ],

                  ),


                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
