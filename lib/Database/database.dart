import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:path/path.dart';
import 'dart:io' as io;
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';


import '../Model/signDetail.dart';

class DbHelper {
  static const _databaseName = "myDb.db";
  static const _databaseVersion = 1;

  static const table = 'signInTable';

  static const email = 'email';
  static const firstname = 'firstname';
  static const mobile = 'mobile';
  static const password = 'password';

  DbHelper._privateConstructor();
  static final DbHelper instance = DbHelper._privateConstructor();

  static Database? _db;

  Future<Database?> get db async {
    if (_db != null) {
      return _db;
    }

    _db = await _initDb();
    return _db;
  }

  ///creating database in directory
  _initDb() async {
    try {
      io.Directory directory = await getApplicationDocumentsDirectory();
      String path = join(directory.path, _databaseName);
      if (kDebugMode) {
        print("Database path=$path");
      }
      var db1 = await openDatabase(path,
          version: _databaseVersion, onCreate: _onCreate);
      return db1;
    } catch (e) {
      if (kDebugMode) {
        //print("Could not read th file");
        throw Exception("Error is:$e");
      }
    }
  }

  ///Create a table of signup details
  void _onCreate(Database db, int version) async {
    ///creating table
    try {
      await db.execute('''
          CREATE TABLE $table(
           $email VARCHAR NOT NULL,
           $firstname VARCHAR NOT NULL,
           $mobile VARCHAR NOT NULL,
           $password INTEGER NOT NULL
           
           )
      ''');
    } catch (e) {
      throw Exception(e.toString());
    }
    if (kDebugMode) {
      print("Table Created");
    }
  }


  ///Save sign in details

  void saveDetail(SignDetail signDetail) async {
    try {
      var dbClient = await db;
      var value = {
        'email': signDetail.email,
        'firstname': signDetail.firstname,
        'mobile': signDetail.mobile,
        'password':signDetail.password,

      };
        /* var res = await txn.insert('SignDetailTable',signDetail.toMap());*/

       var a =  await dbClient?.insert(table, value);
       if (kDebugMode) {
         print("RESULT=$a");
       }


    } on Exception catch (e) {
      if (kDebugMode) {
        print("Error is $e");
      }
    }
  }

  ///Retrieving data from table
  Future<String> getDetail() async {
    try {

      List<Map>? list = await _db?.query(table);
      print(list);
      List<SignDetail> detail = <SignDetail>[];
      var res2 ;
      for (int i = 0; i < list!.length; i++) {
        res2 = list[i]["email"];

        /*detail.add(SignDetail(
            list[i]["email"], list[i]["firstname"], list[i]["mobile"],list[i]["Password"]));*/

        /*detail.add(SignDetail(
            list[i]["email"], list[i]["firstname"], list[i]["mobile"],list[i]["Password"]));*/
      }
      print('Email is :$res2');
      return res2;
    } catch (e) {
      print("Error is >>> $e");
      throw Exception("Exception is $e");

    }

  }
  getUserDetail()async{
    try{
      var result = await _db?.query(table);
     if (kDebugMode) {
       print("UserDetail==$result");
     }
     return result;
    }catch(e){
      if (kDebugMode) {
        print("Error===$e");

      }
    }
  }

  checkEmail()async{

  }

  check({String? email,String? pass}) async{
    bool res = true;
    try {
      var result = await _db?.query(table,where: 'email = ? and  password = ?',whereArgs: [email,pass]);

      if( result == null || result.length.isEqual(0)){
        res = false;
      }else{
        res = true;
      }
      print("After Query $result");
      print(res);
      return res;

    }
    catch(e){
      if (kDebugMode) {
        print("Error== $e");
      }
    }
  }

    /*getDetail() async {
    List<Map> maps = await _db?.query(table,where: 'email = ?',whereArgs: [email]);
    if (maps.length > 0) {
      return SignDetail.fromMap(maps.first);
    }
    return null;
  }*/

}
