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
}
