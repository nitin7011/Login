import 'trial2.dart';
import 'package:get/get.dart';
import 'trialModel.dart';

class trialControl extends GetxController {
  repo rep = repo();
  TrialModel model = TrialModel();

  var isLoading = true.obs;
  var isServerError = false.obs;

  getall() async {
    try {
      isLoading.value = true;
      model = await rep.getInfo();
      isLoading.value = false;
    } catch (e) {
      print(e.toString());
      isLoading.value = false;
      isServerError.value = true;
      throw Exception(e);
    }
  }
}