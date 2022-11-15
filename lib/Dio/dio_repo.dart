import '../Model/userModel.dart';
import 'dio_client.dart';

class UserRepository{
  Future<UserModel> getUser() async{
    try{
      var  result = await ApiClient().getData("https://random-data-api.com/api/v2/users");
     // final List data  = result["data"];
     // print("DAta="+result.toString());
      return UserModel.fromJson(result);

    }
    catch (e){
   //   print("Error"+e.toString());
      throw Exception(e);
    }
  }
}