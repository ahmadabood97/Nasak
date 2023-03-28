import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../../../../../../../../../../core/widgets/loading_alert_dialog.dart';
import '../../models/shop_model.dart';
import '../repo/shop_repo.dart';

class ShopProvider extends ChangeNotifier {
  final ShopRepo shopRepo;

  ShopProvider({required this.shopRepo});

  ShopDetailsResponse? _shopDetailsResponse;
  ShopDetailsResponse? get shopDetails => _shopDetailsResponse;

  List<SPcategories> _categoriesList = [];
  List<SPcategories>? get categoriesList => _categoriesList;

  List<SpProducts> _productsList = [];
  List<SpProducts>? get productsList => _productsList;

  List<SpProducts> _productsPaginationList = [];

  int page = 0;
  bool hasMore = true;

  int tabSelected = 0;
  String catIdSelected = '';

  bool? getData;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  void setTabSelected(int value, String shopId, String catId,
      BuildContext context, VoidCallback closeLoading) {
    tabSelected = value;
    catIdSelected = catId;
    hasMore = true;
    page = 0;
    getShopDetails(shopId, catId,
        showLoading: true, closeLoading: closeLoading, context: context);
    notifyListeners();
  }

  clear() {
    hasMore = true;
    page = 0;
    tabSelected = 0;
    catIdSelected = '';
    _productsList = [];
    _categoriesList = [];
    _productsPaginationList = [];
  }

  Future getShopDetails(String shopId, String catId,
      {bool showLoading = false,
      VoidCallback? showShopDetails,
      VoidCallback? closeLoading,
      BuildContext? context}) async {
    getData = null;
    _isLoading = true;

    if (showLoading) {
      loading(context!);
    }

    try {
      final result = await InternetAddress.lookup('example.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        http.Response apiResponse =
            await shopRepo.getShopDetails(shopId, catId, page);
        _isLoading = true;
        if (apiResponse.statusCode == 200) {
          log("Get Shops Details Success");

          if (showLoading) {
            closeLoading!();
          }
          getData = true;
          _shopDetailsResponse =
              ShopDetailsResponse.fromJson(json.decode(apiResponse.body));

          if (_shopDetailsResponse!.result!.spProducts != null) {
            if (page == 0) {
              _productsList = _shopDetailsResponse!.result!.spProducts!;
              for (int i = 0; i < _productsList.length; i++) {
                _productsList[i].productDetails = [];

                if (_productsList[i].productAttAsJson != null) {
                  for (int j = 0;
                      j <
                          json
                              .decode(_productsList[i].productAttAsJson!)
                              .length;
                      j++) {
                    _productsList[i].productDetails!.add(
                        ProductDetails.fromJson(json
                            .decode(_productsList[i].productAttAsJson!)[j]));
                  }
                }
              }
            } else {
              _productsPaginationList =
                  _shopDetailsResponse!.result!.spProducts!;
              for (int i = 0; i < _productsPaginationList.length; i++) {
                _productsPaginationList[i].productDetails = [];

                if (_productsPaginationList[i].productAttAsJson != null) {
                  for (int j = 0;
                      j <
                          json
                              .decode(
                                  _productsPaginationList[i].productAttAsJson!)
                              .length;
                      j++) {
                    _productsPaginationList[i].productDetails!.add(
                        ProductDetails.fromJson(json.decode(
                            _productsPaginationList[i].productAttAsJson!)[j]));
                  }
                }
              }
              _productsList.addAll(_productsPaginationList);
            }
          }

          if (page == 0 && _shopDetailsResponse!.result!.sPcategories != null) {
            _categoriesList = [];
            _categoriesList.add(SPcategories(name: 'الكل', id: ''));
            _categoriesList.addAll(_shopDetailsResponse!.result!.sPcategories!);
          }

          if (showShopDetails != null) {
            showShopDetails();
          }
          if (_shopDetailsResponse!.result!.spProducts != null &&
              _shopDetailsResponse!.result!.spProducts!.length < 10) {
            hasMore = false;
          }

          page++;
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
