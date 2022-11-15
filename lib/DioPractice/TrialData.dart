import 'package:flutter/material.dart';

import 'TrialController.dart';
import 'package:get/get.dart';


class trialData extends StatefulWidget{
  @override
  State<trialData> createState() => _trialDataState();
}

class _trialDataState extends State<trialData> {
  trialControl controller = Get.put(trialControl());


  @override
  void initState() {
    controller.getall();
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
                  Text(controller.model.name!,style: const TextStyle(fontSize: 20),),
                  Text(controller.model.id!,style: const TextStyle(fontSize: 25),),
                  Text(controller.model.country!,style: const TextStyle(fontSize: 25),),




                ],
              );
            }
        )
    );
  }
}