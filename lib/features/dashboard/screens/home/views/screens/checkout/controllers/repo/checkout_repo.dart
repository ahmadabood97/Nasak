import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:nasak/core/api/end_points.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../models/checkout_model.dart';

class CheckoutRepo {
  final SharedPreferences sharedPreferences;

  CheckoutRepo({required this.sharedPreferences});

  Future<http.Response> checkout(
      String token, CheckoutModel checkoutModel) async {
    // log("Add Order Token is :$token");

    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    };
    var request = http.Request(
        'POST', Uri.parse('${EndPoints.baseUrl}Orders/PlaceOrder'));

    request.body = json.encode(checkoutModel.toJson());
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    http.Response response1 = await http.Response.fromStream(response);

    return response1;
  }
}
