import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class ApiClients {
  Future getDetail(String path) async {
    try {
      Dio dio = Dio();
      var response = await dio.get(path);
      return response.data;
    }catch(e){
      if (kDebugMode) {
        print("error is :$e");
      }
    }
  }
}