import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../../../../../../../../core/api/end_points.dart';

class CategoryDetailsRepo {
  final SharedPreferences sharedPreferences;

  CategoryDetailsRepo({required this.sharedPreferences});

  Future<http.Response> getCategoryDetails(
      String categoryId, String locationId, String currencyId, int page) async {
    var request = http.Request(
        'GET',
        Uri.parse(
            '${EndPoints.baseUrl}Categories/GetCategoriesVM?Category_Id=$categoryId&Location_Id=$locationId&Currency_Id=$currencyId&Page_Id=${page.toString()}&Rows_Count=10'));

    http.StreamedResponse response = await request.send();
    http.Response response1 = await http.Response.fromStream(response);

    return response1;
  }
}
