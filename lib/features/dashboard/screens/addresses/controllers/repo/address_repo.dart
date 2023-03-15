import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:nasak/core/api/end_points.dart';
import 'package:nasak/features/auth/screens/login/models/login_response_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../models/address_model.dart';

class AddressRepo {
  final SharedPreferences sharedPreferences;

  AddressRepo({required this.sharedPreferences});

  Future<http.Response> getAddress(String token) async {
    log("Address Token is :$token");
    var headers = {
      'Authorization': 'Bearer $token',
    };
    var request = http.Request(
        'GET', Uri.parse('${EndPoints.baseUrl}Addresses/GetAddress'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    http.Response response1 = await http.Response.fromStream(response);

    return response1;
  }

  Future<http.Response> addAddress(
      LoginResponseModel userData, Addersses address) async {
    log("Add Address Token is :${userData.authToken}");

    var headers = {
      'Authorization': 'Bearer ${userData.authToken}  }',
      'Content-Type': 'application/json',
    };
    var request =
        http.Request('POST', Uri.parse('${EndPoints.baseUrl}Addresses'));
    request.body = json.encode({
      "addressName": address.addressName,
      "clientGuid": userData.id,
      "countryGuid": address.countryGuid,
      "cityGuid": address.cityGuid,
      "regionGuid": address.regionGuid,
      "userAddress": address.userAddress,
      "addressExtraDesc": address.addressExtraDesc,
      "phonenumber": address.phonenumber,
      "firstname": address.firstname,
      "lastname": address.lastname,
      "locLat": address.locLat,
      "locLong": address.locLong,
      "buildName": address.buildName,
      "floorNum": address.floorNum,
      "entranceNum": address.entranceNum,
    });
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    http.Response response1 = await http.Response.fromStream(response);

    return response1;
  }
}
