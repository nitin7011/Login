import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart' show kDebugMode, kIsWeb;


class Authentication {

  static SnackBar customSnackBar({required String content}) {
    return SnackBar(
      backgroundColor: Colors.lightBlue,
      content: Text(
        content,
        style: const TextStyle(color: Colors.white, letterSpacing: 0.5),
      ),
    );
  }


  static Future<FirebaseApp> initializeFirebase(
      {required BuildContext context}) async {
    FirebaseApp firebaseApp = await Firebase.initializeApp();
    User? user = FirebaseAuth.instance.currentUser;

    /*if (user != null) {
      // ignore: use_build_context_synchronously
      Navigator.push(context, MaterialPageRoute(builder: (context) => homepage()));
    }*/
    return firebaseApp;
  }

  static Future<User?> signInWithGoogle({required BuildContext context})async{
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;
    if(kIsWeb){
      GoogleAuthProvider authProvider = GoogleAuthProvider();
      try{
      final  UserCredential userCredential = await auth.signInWithPopup(authProvider);
        user = userCredential.user;
      }catch(e){
          if (kDebugMode) {
            print(e);
          }
      }
    }else{
      final GoogleSignIn googleSignIn = GoogleSignIn();
      final GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();
      if(googleSignInAccount != null){
        final GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount.authentication;

        final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken:googleSignInAuthentication.accessToken ,
          idToken:googleSignInAuthentication.idToken
        );

        try{
          final UserCredential userCredential = await auth.signInWithCredential(credential);
          user = userCredential.user;

          if (kDebugMode) {
            print('login details details: $userCredential');
            print('dfdfffdfdfdf\n $user');
          }

        }on FirebaseAuthException catch(e){
            if(e.code == 'account-exists-with-different-credentials'){

              // ignore: use_build_context_synchronously
              ScaffoldMessenger.of(context).showSnackBar(
                Authentication.customSnackBar(
                  content: 'The account is already exists with different credential'
                ),
              );
            }
            else if(e.code == 'invalid-credentials'){
              // ignore: use_build_context_synchronously
              ScaffoldMessenger.of(context).showSnackBar(
                Authentication.customSnackBar(
                    content: 'The credentials are not valid'
                ),
              );
            }
        }catch(e){
          // ignore: use_build_context_synchronously
          ScaffoldMessenger.of(context).showSnackBar(
            Authentication.customSnackBar(
                content: 'Error occurred'
            ),
          );
        }
      }
    }
    return user;
  }

  static Future<void> signOut({required BuildContext context}) async{
    final GoogleSignIn googleSignIn = GoogleSignIn();

    try{
      if(!kIsWeb){
        await googleSignIn.signOut();
      }
      await FirebaseAuth.instance.signOut();
    }catch(e){
      ScaffoldMessenger.of(context).showSnackBar(
        Authentication.customSnackBar(
            content:'You are signing out'
        ),
      );
    }
  }
}
