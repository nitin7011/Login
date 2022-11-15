import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';


import 'Personal.dart';
import 'Portfolio.dart';
import 'favourites.dart';

class TaskManager extends StatefulWidget {
  const TaskManager({Key? key}) : super(key: key);

  @override
  State<TaskManager> createState() => _TaskManagerState();
}

class _TaskManagerState extends State<TaskManager>
    with SingleTickerProviderStateMixin {
  late final tabController = TabController(length: 4, vsync: this);

  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    Text('feeds', style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
    Text('Search', style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
    Text('Add', style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
    Text('mail', style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
    Text('Profile Page', style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }



  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 25, left: 16),
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Text(
                    'Hey , ',
                    style: TextStyle(fontSize: 21),
                  ),
                  const Text(
                    'Robert Wari ',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                  ),
                  Image.network(
                    'https://img.icons8.com/emoji/512/waving-hand-emoji.png',
                    width: 25,
                    height: 25,
                  ),
                ],
              ),
            ),
            Padding(
                padding: const EdgeInsets.only(left: 16.0,top: 0),
                child: Row(children: [
                  Row(
                    children: [
                      const Text(
                        'There are 11 task to complete today.',
                        style: TextStyle(color: Colors.grey),
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.info_outline_rounded,
                            size: 20,
                          ))
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 10.0,
                    ),
                    child: CircularPercentIndicator(
                      radius: 30.0,
                      lineWidth: 3.5,
                      percent: 1.0,
                      center: Text('60%'),
                      progressColor: Colors.green,
                    ),
                  ),
                ],
                ),
            ),



             /*Padding(
               padding: const EdgeInsets.only(top:0.0),
               child: TabBar(
                  controller: tabController,
                  tabs: const [
                    Tab(
                      child: Text(
                        'Workspace',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                    Tab(
                      child: Text(
                        'Portfolio',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                    Tab(
                      child: Text(
                        'Personal',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                    Tab(
                      child: Text(
                        'Favourites',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ],
                ),
             ),

             TabBarView(
              //controller: tabController,
                children: const [
                  Center(child: Text('workspace',style: TextStyle(color: Colors.red),),),
                ]
             ),*/
          ],

        ),
        bottomNavigationBar: BottomNavigationBar(
          items:  [
            const BottomNavigationBarItem(
                icon: Icon(Icons.checklist,color: Colors.grey,size: 30,),
              backgroundColor: Colors.white,
              label: ''
            ),
            const BottomNavigationBarItem(
                icon: Icon(Icons.manage_search_outlined,color: Colors.grey,size: 30,),
              backgroundColor: Colors.white,
              label: ''
            ),
            BottomNavigationBarItem(
                icon: Container(
                  //color: Colors.blue,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.blue
                    ),
                    child: const Icon(Icons.add,color: Colors.white,size: 30,)),
              backgroundColor: Colors.white,
              label: ''
            ),
            const BottomNavigationBarItem(
                icon: Icon(Icons.mail_outline_rounded,color: Colors.grey,size: 30,),
              backgroundColor: Colors.white,
              label: ''
            ),
            const BottomNavigationBarItem(
                icon: Icon(Icons.person_outlined,color: Colors.grey,size: 30,),
                backgroundColor: Colors.white,
              label: '',

            )
          ],
            type: BottomNavigationBarType.shifting,
            currentIndex: _selectedIndex,
            selectedItemColor: Colors.black,
            onTap: _onItemTapped,
            elevation: 5
        ),
      ),
    );
  }
}
