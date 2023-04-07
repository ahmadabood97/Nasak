import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../../../../../../../../../core/api/end_points.dart';

class OrderDetailsRepo {
  final SharedPreferences sharedPreferences;

  OrderDetailsRepo({required this.sharedPreferences});

  Future<http.Response> getOrderDetails(String orderId) async {
    var request = http.Request('GET',
        Uri.parse('${EndPoints.baseUrl}Orders/GetOrderById?Order_Id=$orderId'));
    http.StreamedResponse response = await request.send();
    http.Response response1 = await http.Response.fromStream(response);
    return response1;
  }
}
