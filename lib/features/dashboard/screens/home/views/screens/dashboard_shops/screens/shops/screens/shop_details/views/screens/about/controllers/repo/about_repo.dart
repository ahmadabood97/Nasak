import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../../../../../../../../../../../../core/api/end_points.dart';

class AboutRepo {
  final SharedPreferences sharedPreferences;

  AboutRepo({required this.sharedPreferences});

  Future<http.Response> getAbout(String shopId) async {
    var request = http.Request(
        'GET',
        Uri.parse(
            '${EndPoints.baseUrl}AppServiceProvider/GetAppServiceProviderInfoVM?AppServiceProvider_Id=$shopId'));

    http.StreamedResponse response = await request.send();
    http.Response response1 = await http.Response.fromStream(response);

    return response1;
  }
}
