import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';


import '../Database/MyDetails.dart';
import '../Database/database.dart';
import '../Model/signDetail.dart';

class Sign_up extends StatefulWidget {
  @override

  State<Sign_up> createState() => _Sign_UpState();


}

class _Sign_UpState extends State<Sign_up>{
  final _formKey = GlobalKey<FormState>();
  final dbHelper = DbHelper.instance;


/*  String? firstname;
  String? email;
  String? mobile;
  String? password;*/
  final _controlEmail = TextEditingController();
  final _controlName = TextEditingController();
  final _controlPhone = TextEditingController();
  final _controlPass = TextEditingController();


  @override
  Widget build(BuildContext context) {

    final scaffoldKey =  GlobalKey<ScaffoldState>();
    return  Scaffold(
      backgroundColor: Colors.white,
      key: scaffoldKey,

      body: SingleChildScrollView(
        child: SafeArea(
          child: Center(
            child : Form(
            key: _formKey,
              child: Column(
              children: [

                Image.asset('image/account.png',width:200,height: 200,),

                ///This sign up Container
                Padding(
                  padding: const EdgeInsets.only(left: 34.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: const [
                      Text('Sign up',
                        style: TextStyle(
                          fontSize: 35,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),

                const Padding(padding: EdgeInsets.all(10)),

                ///This is Email container
                Padding(
                  padding: const EdgeInsets.only(left: 38.0, right: 38.0),
                  child: TextFormField(
                    controller: _controlEmail,
                    validator: (value) =>
                        value!.isEmpty ?"Enter Email address" : null,
                   /* onSaved: (value) => email = value,*/


                    decoration: InputDecoration(
                      fillColor: Colors.grey[200],
                      filled: true,
                      prefixIcon: const Icon(Icons.alternate_email_rounded),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                          borderSide: const BorderSide(
                            style: BorderStyle.none,
                            width: 0,
                          )
                      ),
                      hintText: 'Enter Your Email ID',
                    ),

                  ),
                ),


                const Padding(padding: EdgeInsets.all(6)),
                ///This is name container
                Padding(
                  padding: const EdgeInsets.only(left: 38.0, right: 38.0),
                  child: TextFormField(
                    controller: _controlName,
                    validator: (value) =>
                    value!.isEmpty ?"Enter valid name" : null,
                   /* onSaved: (value) => firstname = value,*/




                    decoration: InputDecoration(
                      fillColor: Colors.grey[200],
                      filled: true,
                      prefixIcon: const Icon(Icons.face_sharp),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                          borderSide: const BorderSide(
                            style: BorderStyle.none,
                            width: 0,
                          )
                      ),
                      hintText: 'Full Name',
                    ),
                  ),
                ),

                ///This is mobile container
                const Padding(padding: EdgeInsets.all(6)),
                Padding(
                  padding: const EdgeInsets.only(left: 38.0, right: 38.0),
                  child: TextFormField(
                    controller: _controlPhone,
                    keyboardType: TextInputType.number,
                    validator: (value) =>
                    value!.isEmpty ?"Enter valid number" : null,
                   /* onSaved: (value) => mobile = value,*/

                    decoration: InputDecoration(
                      fillColor: Colors.grey[200],
                      filled: true,

                      prefixIcon: const Icon(Icons.call),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                          borderSide: const BorderSide(
                            style: BorderStyle.none,
                            width: 0,
                          )
                      ),
                      hintText: 'Mobile',

                    ),
                  ),
                ),

                const Padding(padding: EdgeInsets.all(6)),
                Padding(
                  padding: const EdgeInsets.only(left: 38.0, right: 38.0),
                  child: TextFormField(
                    controller: _controlPass,

                    validator: (value) =>
                    value!.isEmpty ?"Enter valid password" : null,
              /*      onSaved: (value) => mobile = value,*/

                    decoration: InputDecoration(
                      fillColor: Colors.grey[200],
                      filled: true,

                      prefixIcon: const Icon(Icons.password),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                          borderSide: const BorderSide(
                            style: BorderStyle.none,
                            width: 0,

                          )
                      ),
                      hintText: 'Password',


                    ),
                    obscureText: true,
                  ),
                ),



                ///This is terms and condition

                const Padding(padding: EdgeInsets.all(10)),
                Container(
                  child:
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        "By signing up, you're agree to our"
                        ,style: TextStyle(
                        color: Colors.grey,
                      ) ,
                      ),

                      Text(" Terms & conditions",style: TextStyle(
                        color: Colors.blue,
                      ),
                      ),
                    ],

                  ),
                ),

                const Padding(padding: EdgeInsets.all(2)),

                Row(

                  mainAxisAlignment: MainAxisAlignment.start,

                  children: const [
                    Padding(padding: EdgeInsets.only(left: 38)),
                    Text(" and ",style:
                    TextStyle(
                      color: Colors.grey,
                    ),),
                    Text('Privacy policy',
                      style: TextStyle(
                        color: Colors.blue,
                      ),)

                  ],
                ),

                ///This is button Container
                const Padding(padding: EdgeInsets.all(20)),
                SizedBox(
                  width: 300,
                  height: 60,
                  child: ElevatedButton(
                    onPressed: ()  {
                      _submit();
                      /*print(Platform.operatingSystem);
                      final directory = await getApplicationDocumentsDirectory();
                      print(directory);*/
                      /*if(_formKey.currentState!.validate()){
                    }*/

                    },
                    style:  ButtonStyle(
                      shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      ),
                      backgroundColor:  MaterialStatePropertyAll<Color>(Colors.blue[800]!),

                    ),
                    child: const Text('Continue'),
                  ),
                ),

                const Padding(padding: EdgeInsets.all(20)),
                SizedBox(
                  width: 300,
                  height: 60,
                  child: ElevatedButton(
                    onPressed: (){
                      navigateToList();
                      /*if(_formKey.currentState!.validate()){
                    }*/
                    },
                    style:  ButtonStyle(
                      shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      ),
                      backgroundColor:  MaterialStatePropertyAll<Color>(Colors.blue[800]!),

                    ),
                    child: const Text('Check List'),
                  ),
                ),

                const Padding(padding: EdgeInsets.all(15)),
                ///This is the end of create page
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Joined us before?",
                      style:TextStyle(
                        color: Colors.grey,
                        fontSize: 15,
                      ) ,
                    ),

                    TextButton(onPressed: () {
                      Navigator.pop(context);
                    },
                      child: const Text('Login',
                        style: TextStyle(
                            color: Colors.blue,
                            fontSize: 15
                        ),
                      ),
                    ),
                  ],
                )

              ],
             ),
            ),
          ),
        ),
      ),

    );
  }

  void _submit() async{

    if(_formKey.currentState!.validate()){
      try {
        _formKey.currentState!.save();
      }catch(e){
        //print("Error is "  + e.toString());
        throw Exception(e.toString());
      }

    }

      SignDetail signDetail = SignDetail(
          _controlEmail.text, _controlName.text, _controlPhone.text, _controlPass.text);
      dbHelper.saveDetail(signDetail);
      //dbHelper.getUserDetail();
      //dbHelper.delete('xyz@gmail.com');



  }

  void navigateToList() {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => DetailList() ));

  }




}






/*
 validator: (value) =>

                      if (value!.isEmpty || !RegExp(
                          r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(
                          value)) {
                        //allow upper and lower case alphabets and space
                        return "Enter valid Email Address";

                      } else {
                        return null;
                      }
                      onSaved: (value) => this.email = value,
                    , */


/*
validator: (value) {
                      if (value!.isEmpty || !RegExp(r'^[a-z A-Z]+$').hasMatch(value)) {
                        //allow upper and lower case alphabets and space
                        return "Enter valid Name";
                      } else {
                        return null;
                      }
                    },  */
/*
validator: (value) {
                      if (value!.isEmpty || !RegExp(r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]*$').hasMatch(value)) {
                        //allow upper and lower case alphabets and space
                        return "Enter valid Mobile Number";
                      } else {
                        return null;
                      }
                    },
 */