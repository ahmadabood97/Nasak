import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../../../../../../../../../core/api/end_points.dart';

class OrdersRepo {
  final SharedPreferences sharedPreferences;

  OrdersRepo({required this.sharedPreferences});

  Future<http.Response> getOrders(
      String serviceId, String token, int page) async {
    var headers = {'Authorization': 'Bearer $token'};
    var request = http.Request(
        'GET',
        Uri.parse(
            '${EndPoints.baseUrl}Orders/GetOrders?AppserviceGuid=$serviceId&Page_Id=${page.toString()}&Rows_Count=10'));
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    http.Response response1 = await http.Response.fromStream(response);
    return response1;
  }
}
