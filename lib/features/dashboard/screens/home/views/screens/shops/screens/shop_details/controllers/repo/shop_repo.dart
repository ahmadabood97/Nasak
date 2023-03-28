import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../../../../../../../core/api/end_points.dart';

class ShopRepo {
  final SharedPreferences sharedPreferences;

  ShopRepo({required this.sharedPreferences});

  Future<http.Response> getShopDetails(
      String shopId, String catId, int page) async {
    var request = http.Request(
        'GET',
        Uri.parse(
            '${EndPoints.baseUrl}AppServiceProvider/GetAppServiceProviderDetailVM?AppServiceProvider_Id=$shopId&Category_Id=$catId&Page_Id=${page.toString()}&Rows_Count=10'));

    http.StreamedResponse response = await request.send();
    http.Response response1 = await http.Response.fromStream(response);

    return response1;
  }
}
