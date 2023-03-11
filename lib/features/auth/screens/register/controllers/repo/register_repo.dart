import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../../core/api/end_points.dart';
import '../../models/register_model.dart';

class RegisterRepo {
  final SharedPreferences sharedPreferences;

  RegisterRepo({required this.sharedPreferences});

  Future<http.Response> register(RegisterModel registerModel) async {
    var headers = {
      'Content-Type': 'application/json',
    };
    var request = http.Request(
        'POST', Uri.parse('${EndPoints.baseUrl}Auth/RegisterUser'));
    request.body = json.encode({
      "firstName": registerModel.firstName,
      "lastName": registerModel.lastName,
      "userName": registerModel.userName,
      "password": registerModel.password,
      "primaryPhoneNum": registerModel.primaryPhoneNum,
      "countryGuid": registerModel.countryGuid,
      "cityGuid": registerModel.cityGuid,
      "regionGuid": registerModel.regionGuid,
      "subscribeToNewsletter": registerModel.subscribeToNewsletter,
    });
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

  dynamic getToken() async {
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
