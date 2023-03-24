import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../models/shop_model.dart';
import '../repo/shop_repo.dart';

class ShopProvider extends ChangeNotifier {
  final ShopRepo shopRepo;

  ShopProvider({required this.shopRepo});

  ShopDetailsResponse? _shopDetails;
  ShopDetailsResponse? get shopDetails => _shopDetails;

  int page = 0;
  bool hasMore = true;

  bool? getData;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future getShopDetails(String shopId, VoidCallback success) async {
    getData = null;
    _isLoading = true;

    try {
      final result = await InternetAddress.lookup('example.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        http.Response apiResponse = await shopRepo.getShopDetails(shopId);
        _isLoading = true;
        if (apiResponse.statusCode == 200) {
          log("Get Shops Details Success");
          getData = true;
          _shopDetails =
              ShopDetailsResponse.fromJson(json.decode(apiResponse.body));

          for (int i = 0; i < _shopDetails!.result!.spProducts!.length; i++) {
            _shopDetails!.result!.spProducts![i].productDetails = [];

            if (_shopDetails!.result!.spProducts![i].productAttAsJson != null) {
              for (int j = 0;
                  j <
                      json
                          .decode(_shopDetails!
                              .result!.spProducts![i].productAttAsJson!)
                          .length;
                  j++) {
                _shopDetails!.result!.spProducts![i].productDetails!.add(
                    ProductDetails.fromJson(json.decode(_shopDetails!
                        .result!.spProducts![i].productAttAsJson!)[j]));
              }
            }
          }
          success();
          _isLoading = false;
          notifyListeners();
        } else {
          getData = null;
          _isLoading = false;
          notifyListeners();
          log("Get Shops Details Failed");
        }
      }
    } on SocketException catch (_) {
      getData = null;
      _isLoading = false;
      notifyListeners();
      log("Get Shops Details Failed");
    }
  }
}
