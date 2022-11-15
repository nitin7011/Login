import 'package:demo/DioPractice/trialModel.dart';
import 'trial.dart';

class repo{
Future<TrialModel> getInfo()  async {
  try {
    var res = await ApiClients().getDetail(
        "https://musicbrainz.org/ws/2/artist/5b11f4ce-a62d-471e-81fc-a69a8278c7da?fmt=json");
    return TrialModel.fromJson(res);
  }catch(e){
    throw Exception(e.toString());
  }
}
}