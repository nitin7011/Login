import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/mycontroller.dart';


class userData extends StatefulWidget{
  @override
  State<userData> createState() => _userDataState();
}

class _userDataState extends State<userData> {
  mycontroller controller = Get.put(mycontroller());


  @override
  void initState() {
    controller.getUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {



      return Scaffold(

        appBar: AppBar(
          title: const Text(
            'User Data'
          ),
        ),

        body: Obx(
            (){

              return controller.isLoading.value ? Center(child: const CircularProgressIndicator()):Column(
                children: [
                  Text(controller.userModel.firstName!,style: const TextStyle(fontSize: 20),),
                  Text(controller.userModel.lastName!,style: const TextStyle(fontSize: 20),),
                  CircleAvatar(
                    backgroundImage: NetworkImage(controller.userModel.avatar!),
                  ),
                  Text(controller.userModel.password!,style: const TextStyle(
                    fontSize: 30,
                  ),)
                ],
              );
            }
        )
      );
  }
}