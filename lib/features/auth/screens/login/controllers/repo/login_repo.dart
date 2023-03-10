import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../../core/api/end_points.dart';

class LoginRepo {
  final SharedPreferences sharedPreferences;

  LoginRepo({required this.sharedPreferences});

  Future<http.Response> login(String email, String password) async {
    log("$email\n$password");

    var headers = {
      'Content-Type': 'application/json',
    };
    var request =
        http.Request('POST', Uri.parse('${EndPoints.baseUrl}Auth/LoginUser'));
    request.body = json.encode({"phoneNumber": email, "password": password});
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    http.Response response1 = await http.Response.fromStream(response);

    return response1;
  }

  Future<void> saveTokenBySharedPref(String token) async {
    try {
      if (sharedPreferences.get('Token') != null) {
        sharedPreferences.remove('Token');
      }
      await sharedPreferences.setString('Token', token);
    } catch (e) {
      rethrow;
    }
  }

  dynamic getToken() {
    try {
      if (sharedPreferences.get('Token') != null) {
        return sharedPreferences.get('Token') as String;
      } else {
        return null;
      }
    } catch (e) {
      rethrow;
    }
  }
}
