import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../../core/api/end_points.dart';
import '../../../home/models/home_model.dart';
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

  Future<void> saveLocationBySharedPref(
      DeliveryLocations deliveryLocations) async {
    try {
      if (sharedPreferences.get('Location') != null) {
        sharedPreferences.remove('Location');
      }
      await sharedPreferences.setString(
          'Location', jsonEncode(deliveryLocations.toJson()));
    } catch (e) {
      rethrow;
    }
  }

  Future<void> saveCountryBySharedPref(Countries countries) async {
    try {
      if (sharedPreferences.get('Country') != null) {
        sharedPreferences.remove('Country');
      }
      await sharedPreferences.setString(
          'Country', jsonEncode(countries.toJson()));
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> getCountryData() async {
    try {
      if (sharedPreferences.get('Country') != null) {
        Map<String, dynamic> map =
            await jsonDecode(sharedPreferences.get('Country') as String);
        return Countries.fromJson(map);
      } else {
        return null;
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> getLocationData() async {
    try {
      if (sharedPreferences.get('Location') != null) {
        Map<String, dynamic> map =
            await jsonDecode(sharedPreferences.get('Location') as String);
        return DeliveryLocations.fromJson(map);
      } else {
        return null;
      }
    } catch (e) {
      rethrow;
    }
  }
}
