import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:nasak/features/auth/screens/register/models/register_response_model.dart';
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

  Future<void> saveUserDataBySharedPref(RegisterResponseModel userData) async {
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

  dynamic getUserData() async {
    try {
      if (sharedPreferences.get('UserData') != null) {
        Map<String, dynamic> map =
            await jsonDecode(sharedPreferences.get('UserData') as String);
        return RegisterResponseModel.fromJson(map);
      } else {
        return null;
      }
    } catch (e) {
      rethrow;
    }
  }
}
