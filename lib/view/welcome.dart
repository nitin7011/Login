import 'package:flutter/material.dart';

class Welcome extends StatefulWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children:[ Container(
            decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [Colors.purple, Colors.lightBlue],
                stops: [0.2, 0.9]),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Stack(
                  children: const [
                    Icon(
                      Icons.star_border_purple500,
                      color: Colors.white,
                      size: 35,
                    ),
                    Padding(
                        padding: EdgeInsets.only(left: 45, top: 20),
                        child: Icon(
                          Icons.crop_square,
                          color: Colors.white,
                          size: 12,
                        )),
                    Padding(
                      padding: EdgeInsets.only(left: 70, top: 45),
                      child: Icon(
                        Icons.circle_outlined,
                        color: Colors.white,
                        size: 12,
                      ),
                    )
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.only(right: 60, bottom: 10),
                  child: Icon(
                    Icons.circle_outlined,
                    color: Colors.white,
                    size: 15,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 15, bottom: 0),
                  child: Icon(
                    Icons.check_circle_outline,
                    color: Colors.white,
                    size: 35,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(25.0),
                  child: Text(
                    'Excellent!',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 32,
                      decoration: TextDecoration.none,
                      fontWeight: FontWeight.w100,
                    ),
                  ),
                ),
                const Text(
                  'YOU ROCK!',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 45,
                    decoration: TextDecoration.none,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Padding(padding: EdgeInsets.only(top: 20)),
                const Center(
                  child: Text(
                    '  You finished your routine \n\n       How do you feel? \n\n The next time will be easier!',
                    style: TextStyle(
                        color: Colors.white,
                        decoration: TextDecoration.none,
                        fontSize: 20,
                        fontWeight: FontWeight.w100),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 80.0),
                  child: Text(
                    'Share your experience',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w200,
                      decoration: TextDecoration.none,
                      fontSize: 20,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        width: 70,
                        height: 70,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue[700],
                              elevation: 8,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50.0),
                              )),
                          child: const CircleAvatar(
                            // radius: 20,
                            backgroundImage: AssetImage(
                              'image/facebook.png',
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 70,
                        height: 70,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue[400],
                              elevation: 8,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50.0),
                              )),
                          child: const CircleAvatar(
                            // radius: 20,
                            backgroundImage: NetworkImage(
                                'https://cdn-icons-png.flaticon.com/512/124/124021.png'),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 40.0),
                  child: SizedBox(
                    width: 300,
                    height: 60,
                    child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white.withOpacity(0.4),
                            elevation: 1,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            )),
                        child: const Text(
                          'Go to home',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        )),
                  ),
                ),
              ],
            ),
          ),
        ),
          Opacity( opacity: 0.1,
            child: ClipPath(
              clipper: cornerClipper(),
              child: Container(
                height: 200,
                color: Colors.purple,
              ),
            ),
          ),

          Opacity( opacity: 0.2,
            child: ClipPath(
              clipper: RightCornerClipper(),
              child: Container(
                height: 150,
                color: Colors.blueGrey,
              ),
            ),
          ),


          Padding(
            padding: const EdgeInsets.only(top: 580.0),
            child: Opacity( opacity: 0.2,
              child: ClipPath(
                clipper: bottomCornerClipper(),
                child: Container(
                  height:150,
                  color: Colors.lightBlue,
                ),
              ),
            ),
          ),
       ]
      ),
    );
  }
}

class cornerClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    debugPrint(size.width.toString());
    var path = Path();
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height-200);
    path.quadraticBezierTo(0, size.height, 0,0);
    path.close();
    return path;


    //throw UnimplementedError();
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return true;
  }
}

class RightCornerClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    debugPrint(size.width.toString());
    var path = Path();
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    path.quadraticBezierTo(0, 0, size.width,size.height);
    path.close();
    return path;


    //throw UnimplementedError();
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return true;
  }
}


class bottomCornerClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    debugPrint(size.width.toString());


    var path = Path();
    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width,size.height);
    path.lineTo(size.width, 0);
    //path.quadraticBezierTo(size.width, 0, 0,0);
    /*var firstControlPoint = Offset(size.width/4, size.height);
    var firstEndPoint = Offset(size.width/2.25, size.height-30.0);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy, firstEndPoint.dx, firstEndPoint.dy);
    
    var secondcontrolpoint = Offset(size.width - (size.width/3.25), size.height-65);
    var secondEndpoint = Offset(size.width, size.height-40);
    path.quadraticBezierTo(secondcontrolpoint.dx, secondcontrolpoint.dy, secondEndpoint.dx, secondEndpoint.dy);
    path.lineTo(size.width, size.height-40);
    path.lineTo(size.width, 0.0);*/

    path.close();
    return path;


    //throw UnimplementedError();
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return true;
  }
}




  

  

