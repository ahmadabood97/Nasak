import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../../core/api/end_points.dart';

class HomeRepo {
  final SharedPreferences sharedPreferences;

  HomeRepo({required this.sharedPreferences});

  Future<http.Response> getHome() async {
    var request = http.Request(
        'GET', Uri.parse('${EndPoints.baseUrl}Home/GetHomePageVM'));
    http.StreamedResponse response = await request.send();
    http.Response response1 = await http.Response.fromStream(response);

    return response1;
  }

  Future<http.Response> getAppServices(
      String serviceId, String locationId) async {
    var request = http.Request(
        'GET',
        Uri.parse(
            '${EndPoints.baseUrl}AppService/GetAppServiceVM?AppService_Id=$serviceId&Location_Id=$locationId&Page_Id=0&Rows_Count=10'));

    http.StreamedResponse response = await request.send();
    http.Response response1 = await http.Response.fromStream(response);

    return response1;
  }
}
