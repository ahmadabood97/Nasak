import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:nasak/core/api/end_points.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CheckoutRepo {
  final SharedPreferences sharedPreferences;

  CheckoutRepo({required this.sharedPreferences});

  Future<http.Response> checkout(String token) async {
    log("Add Order Token is :$token");

    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    };
    var request = http.Request(
        'POST', Uri.parse('${EndPoints.baseUrl}Orders/PlaceOrder'));
    request.body = json.encode({
      "ispickupOrder": false,
      "serviceProiderGuid": "CC1517BB-C221-4931-A2C6-CC51B8268F54",
      "customerGuid": "37f325cf-d4bc-4030-8fba-8c646b898346",
      "OrderDeliveryDateModel": {"year": 2023, "month": 3, "day": 17},
      "OrderDeliveryTimeModel": {"hour": 19, "minutes": 45},
      "paymentMethodGuid": "A707B7CE-8A65-41B2-A8D1-8B5C8AE78F8E",
      "orderItems": [
        {
          "productGuid": "8389F7E3-8475-4DA4-9407-429649DA715C",
          "quantity": "5",
          "unitPrice": "2",
          "priceIncl": "2",
          "finalPrice": "10",
          "isSpecialOfferItem": false
        },
        {
          "productGuid": "BF22FF8C-F781-4F3A-981D-512E4D570A52",
          "quantity": "2",
          "unitPrice": "2",
          "priceIncl": "2",
          "finalPrice": "10",
          "productAttrbutes": [
            {
              "GroupGuid": "A02F7613-23EB-4721-BF87-E50DC4FCFC12",
              "selectedOptionGuid": "16CEE240-4B7B-40AD-9315-51EB98974105"
            },
            {
              "GroupGuid": "163CF3C5-5EC2-4701-BA4E-48FEFB65D21F",
              "selectedOptionGuid": "5288AAA1-F10A-4987-866C-08431FAD9661"
            },
            {
              "GroupGuid": "163CF3C5-5EC2-4701-BA4E-48FEFB65D21F",
              "selectedOptionGuid": "A5958B62-1808-4399-A918-2E623259744A"
            }
          ],
          "isSpecialOfferItem": false
        },
        {
          "productGuid": "BF22FF8C-F781-4F3A-981D-512E4D570A52",
          "quantity": "2",
          "unitPrice": "2",
          "priceIncl": "2",
          "finalPrice": "10",
          "productAttrbutes": [
            {
              "GroupGuid": "A02F7613-23EB-4721-BF87-E50DC4FCFC12",
              "selectedOptionGuid": "25CCE1A2-C714-42D1-98D6-D889B4C4DC72"
            },
            {
              "GroupGuid": "163CF3C5-5EC2-4701-BA4E-48FEFB65D21F",
              "selectedOptionGuid": "5288AAA1-F10A-4987-866C-08431FAD9661"
            }
          ],
          "isSpecialOfferItem": false
        }
      ],
      "deliveryAddress": {
        "addressName": "my home",
        "clientGuid": "073D2153-DF50-41BB-8E88-02EB5D8F04A9",
        "countryGuid": "51585ED2-1396-45A3-AE28-3D7DD2FACB05",
        "cityGuid": "4995D82E-3203-49C0-A2D2-1DF436A2D747",
        "regionGuid": "BBBDB042-BC85-46CB-BE49-5B7BFFA5E06E",
        "userAddress": "alsabil",
        "addressExtraDesc": "no",
        "phonenumber": "+1231232131",
        "firstname": "hassan",
        "lastname": "jlilatt",
        "locLat": "30.34",
        "locLong": "24.32",
        "buildName": "almajad",
        "floorNum": "1",
        "entranceNum": "1"
      },
      "customerCurrencyCode": "sp",
      "currencyRate": 1,
      "currency_Id": "E17B6ADD-0A6D-439B-AA60-68ED7EC77312"
    });
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    http.Response response1 = await http.Response.fromStream(response);

    return response1;
  }
}
