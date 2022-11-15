import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


import '../Database/database.dart';
import '../util/Authentication.dart';
import '../util/animationSignUp.dart';
import 'Sign_up.dart';
import 'homepage.dart';


class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();

}

class _MyHomePageState extends State<MyHomePage> {
  String? firstname;
  String? email;
  String? mobile;
  String? loginEmail;
  bool isSign = false;
  final _controlEmail = TextEditingController();
  final _controlPass = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Center(
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //const Padding(padding: EdgeInsets.all(10)),

                  CachedNetworkImage(
                    imageUrl:
                        "https://img.freepik.com/free-vector/tablet-login-concept-illustration_114360-7963.jpg?w=740&t=st=1664802073~exp=1664802673~hmac=f5c60340a04622539f9f0bbaf786bcc89c53dd36c6820031d5113223b7e394fd",
                    width: 250,
                    height: 250,
                    fit: BoxFit.cover,
                    placeholder: (context, url) =>
                        const CircularProgressIndicator(),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),

                  ///Login Container
                  Padding(
                    padding: const EdgeInsets.only(left: 34.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: const [
                        Text(
                          'Login',
                          style: TextStyle(
                            fontSize: 35,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),

                  ///This is username container
                  const Padding(padding: EdgeInsets.all(8)),
                  Padding(
                    padding: const EdgeInsets.only(left: 38.0, right: 38.0),
                    child: TextFormField(
                      controller: _controlEmail,
                      validator: (value) {
                        if (value!.isEmpty ||
                            !RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                                .hasMatch(value)) {
                          //allow upper and lower case alphabets and space
                          return "Enter valid Email Address";
                        } else {
                          return null;
                        }
                      },
                      onSaved: (value) => loginEmail = value,
                      decoration: InputDecoration(
                        fillColor: Colors.grey[200],
                        filled: true,
                        prefixIcon: const Icon(Icons.alternate_email_rounded),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0),
                            borderSide: const BorderSide(
                              style: BorderStyle.none,
                              width: 0,
                            )),
                        hintText: 'Enter Your Email ID',
                      ),
                    ),
                  ),

                  ///This is password Container
                  const Padding(padding: EdgeInsets.all(10.0)),
                  Padding(
                    padding: const EdgeInsets.only(left: 38.0, right: 38.0),
                    child: TextFormField(
                      controller: _controlPass,
                      validator: (value) {
                        if (value!.length <= 6) {
                          //allow upper and lower case alphabets and space
                          return "Wrong Password";
                        } else {
                          return null;
                        }
                      },
                      decoration: InputDecoration(
                        fillColor: Colors.grey[200],
                        filled: true,
                        prefixIcon: const Icon(Icons.lock_open_rounded),
                        suffixIcon: const Icon(Icons.remove_red_eye),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0),
                            borderSide: const BorderSide(
                              style: BorderStyle.none,
                              width: 0,
                            )),
                        hintText: 'Password',
                      ),
                      obscureText: true,
                    ),
                  ),

                  ///This is Forgot Container
                  const Padding(padding: EdgeInsets.all(8)),
                  const SizedBox(
                    width: 350,
                    child: Text(
                      "Forgot Password?",
                      textAlign: TextAlign.right,
                      style: TextStyle(
                          fontSize: 15,
                          color: Colors.blue,
                          fontWeight: FontWeight.bold),
                    ),
                  ),

                  ///This is Login button container
                  const Padding(padding: EdgeInsets.all(10.0)),
                  SizedBox(
                    width: 300,
                    height: 60,
                    child: ElevatedButton(
                      onPressed: () {

                        if (_formKey.currentState!.validate()) {
                            _check();
                        }
                      },
                      style: ButtonStyle(
                        shape: MaterialStatePropertyAll(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                        ),
                        backgroundColor:
                            MaterialStatePropertyAll<Color>(Colors.blue[800]!),
                      ),
                      child: const Text(
                        'Login',
                        style: TextStyle(
                          fontSize: 25,
                        ),
                      ),
                    ),
                  ),

                  const Padding(padding: EdgeInsets.all(10)),

                  ///this is horizontal line
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                          child: Container(
                        margin: const EdgeInsets.only(left: 35.0, right: 20.0),
                        child: const Divider(
                          thickness: 1.0,
                          color: Colors.grey,
                          height: 20,
                        ),
                      )),
                      const Text('OR'),
                      Expanded(
                        child: Container(
                          margin:
                              const EdgeInsets.only(left: 10.0, right: 35.0),
                          child: const Divider(
                            thickness: 1.0,
                            color: Colors.grey,
                            height: 20,
                          ),
                        ),
                      ),
                    ],
                  ),

                  ///This is option Container
                  const Padding(padding: EdgeInsets.all(15)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      SizedBox(
                        width: 80,
                        height: 60,
                        child: ElevatedButton(
                          onPressed: () async {
                            setState(() {
                              isSign = true;
                            });
                            User? user = await Authentication.signInWithGoogle(context: context);
                            setState(() {
                              isSign = false;
                            });
                            
                            if(user!=null){
                              Navigator.push(context, MaterialPageRoute(builder: (context) => homepage()));
                              /*Navigator.of(context).pushReplacement(
                                MaterialPageRoute(builder: (context) => UserInfoScreen(user: user))
                              );*/
                            }
                          },
                          style:ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            foregroundColor: Colors.white,
                            elevation: 8,
                            //side: const BorderSide(width: 1,color: Colors.grey),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            )
                          ),
                          child: Image.asset('image/google.png',
                          width: 40,
                          height: 40,)
                        ),
                      ),

                      SizedBox(
                        width: 80,
                        height: 60,
                        child: ElevatedButton(
                            onPressed: ()  {

                            },
                            style:ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                foregroundColor: Colors.white,
                                elevation: 8,
                                //side: const BorderSide(width: 1,color: Colors.grey),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                )
                            ),
                            child: Image.asset('image/apple.png',
                              width: 40,
                              height: 40,)
                        ),
                      ),


                      SizedBox(
                        width: 80,
                        height: 60,
                        child: ElevatedButton(
                            onPressed: ()  {

                            },
                            style:ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                foregroundColor: Colors.white,
                                elevation: 8,
                                //side: const BorderSide(width: 1,color: Colors.grey),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                )
                            ),
                            child: Image.asset('image/facebook.png',
                              width: 40,
                              height: 40,)
                        ),
                      ),


                    ],
                  ),

                  ///end of page
                  const Padding(padding: EdgeInsets.all(12.0)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Not a member?',
                        style: TextStyle(fontSize: 13),
                      ),
                      TextButton(
                        onPressed: () {
                          //print("clicked");
                          //Navigator.push(context,
                          //  MaterialPageRoute(builder: (context) => Sign_up()));
                          Navigator.push(context, SizeRoute(page: Sign_up()));
                        },
                        child: const Text(
                          'Register here',
                          style: TextStyle(
                            color: Colors.blue,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

   void _check() async {
     try {
       DbHelper dbHelper = DbHelper.instance;
      // print("Values="+_controlEmail.text.toString()+"  "+_controlPass.text.toString());
     var result1 = await dbHelper.check(email: _controlEmail.text, pass: _controlPass.text);
       print("Values=${_controlEmail.text}  ${_controlPass.text}");
       print(result1);


       if (result1 == true) {
         // ignore: use_build_context_synchronously
         Navigator.push(
             context, MaterialPageRoute(builder: (context) => homepage()));
       }
       else{
         const snackBar = SnackBar(
           backgroundColor: Colors.blue,
           content: Text('Invalid user or password',style: TextStyle(color: Colors.white),textAlign: TextAlign.center,),
         );

         // ignore: use_build_context_synchronously
         ScaffoldMessenger.of(context).showSnackBar(snackBar);
         print("not a user");
       }
     } catch (e) {
       print("Exception is $e");
     }
   }
}


