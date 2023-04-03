import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../../../../../../../../../core/api/end_points.dart';

class OffersRepo {
  final SharedPreferences sharedPreferences;

  OffersRepo({required this.sharedPreferences});

  Future<http.Response> getOffers(
      String serviceId, String locationId, int page) async {
    var request = http.Request(
        'GET',
        Uri.parse(
            '${EndPoints.baseUrl}SpecialOffers/GetSpecialOffers?AppService_Id=$serviceId&Location_Id=$locationId&Page_Id=${page.toString()}&Rows_Count=10'));

    http.StreamedResponse response = await request.send();
    http.Response response1 = await http.Response.fromStream(response);

    return response1;
  }
}
