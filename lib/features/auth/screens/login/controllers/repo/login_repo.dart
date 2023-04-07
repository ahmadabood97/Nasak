import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../../core/api/end_points.dart';
import '../../models/login_response_model.dart';

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

  Future<void> saveUserDataBySharedPref(LoginResponseModel userData) async {
    try {
      if (sharedPreferences.get('UserData') != null) {
        sharedPreferences.remove('UserData');
      }
      await sharedPreferences.setString(
          'UserData', jsonEncode(userData.toJson()));
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> getUserData() async {
    try {
      if (sharedPreferences.get('UserData') != null) {
        Map<String, dynamic> map =
            await jsonDecode(sharedPreferences.get('UserData') as String);
        log(map.toString());

        return LoginResponseModel.fromJson(map);
      } else {
        log('null');
        return null;
      }
    } catch (e) {
      rethrow;
    }
  }

  void logout() {
    sharedPreferences.remove('UserData');
  }
}
