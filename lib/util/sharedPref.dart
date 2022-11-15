import 'dart:io';
import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

const IMAGE_KEY = 'IMAGE_KEY';

class ImageShare {
       static Future<bool> saveImagePrefs(String value) async{
        SharedPreferences prefs = await SharedPreferences.getInstance();
        return await prefs.setString(IMAGE_KEY, value);
      }

     static Future<String?> loadImagePrefs() async{
         SharedPreferences prefs = await SharedPreferences.getInstance();
         return prefs.getString(IMAGE_KEY);
      }

      /*static String base64String(Uint8List data){
         return base64Encode(data);
      }*/

       static imageFrom64BaseString(String base64String) async{
         String url = base64String;
         return ImageShare.saveImagePrefs(url);



       }
}