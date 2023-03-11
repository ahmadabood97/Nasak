import 'package:http/http.dart' as http;
import 'package:nasak/core/api/end_points.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddressRepo {
  final SharedPreferences sharedPreferences;

  AddressRepo({required this.sharedPreferences});

  Future<http.Response> getAddress() async {
    var headers = {
      'Authorization': 'Bearer ${sharedPreferences.getString('Token')}',
    };
    var request = http.Request(
        'GET', Uri.parse('${EndPoints.baseUrl}Addresses/GetAddress'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    http.Response response1 = await http.Response.fromStream(response);

    return response1;
  }
}
