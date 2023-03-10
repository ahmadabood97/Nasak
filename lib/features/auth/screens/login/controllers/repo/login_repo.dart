import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../../core/api/end_points.dart';

class LoginRepo {
  final SharedPreferences sharedPreferences;

  LoginRepo({required this.sharedPreferences});

  Future<http.Response> login() async {
    var headers = {
      'Content-Type': 'application/json',
    };
    var request =
        http.Request('POST', Uri.parse('${EndPoints.baseUrl}Auth/LoginUser'));
    request.body =
        json.encode({"phoneNumber": "0987333112", "password": "Test123"});
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    http.Response response1 = await http.Response.fromStream(response);

    return response1;
  }
}
