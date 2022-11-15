import 'package:dio/dio.dart';

class ApiClient{
  Future getData(String path) async {
    try{
      Dio dio = Dio();
      final response = await dio.get(path);
      return response.data;
    }on DioError catch(e){
      //print("Error="+e.toString());
      throw Exception(e.message);
    }
  }
}