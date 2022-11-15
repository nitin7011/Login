import 'package:get/get.dart';
import 'package:dio/dio.dart';

import '../Dio/dio_repo.dart';
import '../Model/userModel.dart';
import '../view/userData.dart';


class mycontroller extends GetxController{

  UserModel userModel = UserModel();
  userData userdata = userData();
  UserRepository userRepository =UserRepository();
  var isLoading = true.obs;
  var isServerError = false.obs;


  /*Future getData(String path) async {
    try{
      Dio dio = Dio();
      final response = await dio.get(path);
      return UserModel.fromJson(response.data);

    }on DioError catch(e){
      //print("Error="+e.toString());
      throw Exception(e.message);
    }
  }*/

   getUser() async{
    try{
      isLoading.value = true;
      userModel = await userRepository.getUser();
      isLoading.value = false;
      // final List data  = result["data"];

      // print("DAta="+result.toString());
      // return UserModel.fromJson(result);

    }
    catch (e){
      print("Errror"+e.toString());
      isLoading.value = false;
      isServerError.value = true;
      //   print("Error"+e.toString());
      throw Exception(e);
    }
  }


}