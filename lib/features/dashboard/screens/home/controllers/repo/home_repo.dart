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

  Future<http.Response> getShops(String serviceId, String locationId, int page,
      String catIdSelected) async {
    var request = http.Request(
        'GET',
        Uri.parse(
            '${EndPoints.baseUrl}AppService/GetAppServiceVM?AppService_Id=$serviceId&Location_Id=$locationId&Page_Id=${page.toString()}&Rows_Count=5&Category_Id=$catIdSelected'));

    http.StreamedResponse response = await request.send();
    http.Response response1 = await http.Response.fromStream(response);

    return response1;
  }

  Future<http.Response> getCategories(String serviceId, String locationId,
      int page, String catIdSelected) async {
    var request = http.Request(
        'GET',
        Uri.parse(
            '${EndPoints.baseUrl}AppService/GetAppServiceVM?AppService_Id=$serviceId'));

    http.StreamedResponse response = await request.send();
    http.Response response1 = await http.Response.fromStream(response);

    return response1;
  }
}
