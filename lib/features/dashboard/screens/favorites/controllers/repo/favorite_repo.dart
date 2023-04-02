import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:nasak/core/api/end_points.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavoriteRepo {
  final SharedPreferences sharedPreferences;

  FavoriteRepo({required this.sharedPreferences});

  Future<http.Response> getFavorites(String token) async {
    log("Favorite Token is :$token");
    var headers = {
      'Authorization': 'Bearer $token',
    };
    var request =
        http.Request('GET', Uri.parse('${EndPoints.baseUrl}Fav/GetFavVM'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    http.Response response1 = await http.Response.fromStream(response);

    return response1;
  }

  Future<http.Response> addToFavorites(String shopId, String token) async {
    log("Add Favorite Token is :$token");

    log("Add Favorite shopId is :$shopId");

    var headers = {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json'
    };
    var request = http.Request('POST', Uri.parse('${EndPoints.baseUrl}Fav'));
    request.body = json.encode({"serviceProvider_Id": shopId});
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    http.Response response1 = await http.Response.fromStream(response);

    return response1;
  }

  Future<http.Response> deleteFromFavorites(String shopId, String token) async {
    log("Delete Favorite Token is :$token");

    log("Delete Favorite shopId is :$shopId");

    var headers = {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json'
    };
    var request = http.Request('DELETE', Uri.parse('${EndPoints.baseUrl}Fav'));
    request.body = json.encode({"serviceProvider_Id": shopId});
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    http.Response response1 = await http.Response.fromStream(response);

    return response1;
  }
}
