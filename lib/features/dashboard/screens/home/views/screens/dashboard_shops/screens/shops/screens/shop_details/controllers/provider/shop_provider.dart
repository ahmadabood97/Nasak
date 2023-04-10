import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../../../../../../../../../../../../core/widgets/loading_alert_dialog.dart';
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

  bool isFav = false;

  int page = 0;
  bool hasMore = true;

  int tabSelected = 0;
  String catIdSelected = '';

  bool? getData;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  void editIsFav() {
    isFav = true;
    notifyListeners();
  }

  void setTabSelected(int value, String shopId, String catId, String token,
      BuildContext context, VoidCallback closeLoading) {
    tabSelected = value;
    catIdSelected = catId;
    hasMore = true;
    page = 0;
    getShopDetails(shopId, catId, token,
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
    isFav = false;
  }

  void initialExtraToPrice() {
    for (int i = 0; i < _productsList.length; i++) {
      if (_productsList[i].extraList.isNotEmpty) {
        for (int j = 0; j < _productsList[i].extraList.length; j++) {
          if (_productsList[i].extraList[j][0].affectPrice! &&
              _productsList[i].extraList[j][0].isFixedPrice! &&
              _productsList[i].extraList[j][0].attrType == 1) {
            _productsList[i].priceWithExtra =
                _productsList[i].extraList[j][0].optionPriceAdj ??
                    _productsList[i].priceWithExtra;
          } else if (_productsList[i].extraList[j][0].affectPrice! &&
              _productsList[i].extraList[j][0].isExtraPrice! &&
              _productsList[i].extraList[j][0].attrType == 1) {
            if (_productsList[i].priceWithExtra != null &&
                _productsList[i].extraList[j][0].isExtraPrice != null) {
              double price =
                  double.parse(_productsList[i].priceWithExtra.toString());
              double extraPrice = double.parse(
                  _productsList[i].extraList[j][0].optionPriceAdj.toString());
              price += extraPrice;
              _productsList[i].priceWithExtra = price.toString();
            }
          }
        }
      }
    }
    notifyListeners();
  }

  void initialExtraToPriceItem(SpProducts product) {
    if (product.extraList.isNotEmpty) {
      for (int j = 0; j < product.extraList.length; j++) {
        if (product.extraList[j][0].affectPrice! &&
            product.extraList[j][0].isFixedPrice! &&
            product.extraList[j][0].attrType == 1) {
          product.priceWithExtra =
              product.extraList[j][0].optionPriceAdj ?? product.priceWithExtra;
        } else if (product.extraList[j][0].affectPrice! &&
            product.extraList[j][0].isExtraPrice! &&
            product.extraList[j][0].attrType == 1) {
          if (product.priceWithExtra != null &&
              product.extraList[j][0].isExtraPrice != null) {
            double price = double.parse(product.priceWithExtra.toString());
            double extraPrice =
                double.parse(product.extraList[j][0].optionPriceAdj.toString());
            price += extraPrice;
            product.priceWithExtra = price.toString();
          }
        }
      }
    }
    notifyListeners();
  }

  void addExtraToPrice(SpProducts product, ProductDetails productDetails) {
    if (productDetails.affectPrice != null &&
        productDetails.isFixedPrice != null &&
        productDetails.affectPrice! &&
        productDetails.isFixedPrice!) {
      product.priceWithExtra = productDetails.optionPriceAdj;

      if (product.productDetails != null) {
        for (var element in product.productDetails!) {
          if (element.isSelected && element.attrType == 3) {
            double price = double.parse(product.priceWithExtra.toString());
            double extraPrice = double.parse(element.optionPriceAdj.toString());
            price += extraPrice;
            product.priceWithExtra = price.toString();
          }
        }
      }
    } else if (productDetails.affectPrice != null &&
        productDetails.isExtraPrice != null &&
        productDetails.affectPrice! &&
        productDetails.isExtraPrice!) {
      double price = double.parse(product.priceWithExtra.toString());
      double extraPrice =
          double.parse(productDetails.optionPriceAdj.toString());
      price += extraPrice;
      product.priceWithExtra = price.toString();
    }
    notifyListeners();
  }

  void decreaseExtraToPrice(SpProducts product, ProductDetails productDetails) {
    double price = double.parse(product.priceWithExtra.toString());
    double extraPrice = double.parse(productDetails.optionPriceAdj.toString());
    price -= extraPrice;
    product.priceWithExtra = price.toString();
    notifyListeners();
  }

  Future getShopDetails(String shopId, String catId, String token,
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
            await shopRepo.getShopDetails(shopId, catId, token, page);
        _isLoading = true;
        if (json.decode(apiResponse.body)['statusCode'] == 200) {
          log("Get Shops Details Success");

          if (showLoading) {
            closeLoading!();
          }
          getData = true;
          _shopDetailsResponse =
              ShopDetailsResponse.fromJson(json.decode(apiResponse.body));

          isFav = _shopDetailsResponse!.result!.isFav!;
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
                    if (!_productsList[i].extraHelpList.contains(
                        json.decode(_productsList[i].productAttAsJson!)[j]
                            ['GroupName'])) {
                      _productsList[i].extraHelpList.add(
                          json.decode(_productsList[i].productAttAsJson!)[j]
                              ['GroupName']);
                    }
                    _productsList[i].productDetails!.add(
                        ProductDetails.fromJson(json
                            .decode(_productsList[i].productAttAsJson!)[j]));
                  }

                  for (int k = 0;
                      k < _productsList[i].extraHelpList.length;
                      k++) {
                    _productsList[i].extraList.add([]);
                    for (int g = 0;
                        g < _productsList[i].productDetails!.length;
                        g++) {
                      if (_productsList[i].productDetails![g].groupName ==
                          _productsList[i].extraHelpList[k]) {
                        _productsList[i]
                            .extraList[k]
                            .add(_productsList[i].productDetails![g]);
                      }
                    }
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
                    if (!_productsPaginationList[i].extraHelpList.contains(
                        json.decode(
                                _productsPaginationList[i].productAttAsJson!)[j]
                            ['GroupName'])) {
                      _productsPaginationList[i].extraHelpList.add(json.decode(
                              _productsPaginationList[i].productAttAsJson!)[j]
                          ['GroupName']);
                    }
                    _productsPaginationList[i].productDetails!.add(
                        ProductDetails.fromJson(json.decode(
                            _productsPaginationList[i].productAttAsJson!)[j]));
                  }
                  for (int k = 0;
                      k < _productsPaginationList[i].extraHelpList.length;
                      k++) {
                    _productsPaginationList[i].extraList.add([]);

                    for (int g = 0;
                        g < _productsPaginationList[i].productDetails!.length;
                        g++) {
                      if (_productsPaginationList[i]
                              .productDetails![g]
                              .groupName ==
                          _productsPaginationList[i].extraHelpList[k]) {
                        _productsPaginationList[i]
                            .extraList[k]
                            .add(_productsPaginationList[i].productDetails![g]);
                      }
                    }
                  }
                }
              }
              _productsList.addAll(_productsPaginationList);
            }

            initialExtraToPrice();
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
