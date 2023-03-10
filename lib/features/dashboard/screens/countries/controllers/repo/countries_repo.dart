import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../../core/api/end_points.dart';
import '../../models/countries_model.dart';

class CountriesRepo {
  final SharedPreferences sharedPreferences;

  CountriesRepo({required this.sharedPreferences});

  Future<http.Response> getCountries() async {
    var request = http.Request(
        'GET', Uri.parse('${EndPoints.baseUrl}Report/GetLocationVM'));

    http.StreamedResponse response = await request.send();
    http.Response response1 = await http.Response.fromStream(response);

    return response1;
  }

  Future<void> saveLocationBySharedPref(Countries countries) async {
    try {
      if (sharedPreferences.get('Location') != null) {
        sharedPreferences.remove('Location');
      }
      await sharedPreferences.setString(
          'Location', jsonEncode(countries.toJson()));
    } catch (e) {
      rethrow;
    }
  }

  dynamic locationData() {
    try {
      if (sharedPreferences.get('Location') != null) {
        Map<String, dynamic> map =
            jsonDecode(sharedPreferences.get('Location') as String);
        log(map.toString());
        return Countries.fromJson(map);
      } else {
        return null;
      }
    } catch (e) {
      rethrow;
    }
  }
}
