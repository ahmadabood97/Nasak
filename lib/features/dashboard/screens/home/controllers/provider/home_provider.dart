import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../models/app_services_model.dart';
import '../../models/home_model.dart';
import '../../views/screens/dashboard_shops/screens/shops/screens/shop_details/models/shop_model.dart';
import '../repo/home_repo.dart';

class HomeProvider extends ChangeNotifier {
  final HomeRepo homeRepo;

  HomeProvider({required this.homeRepo});

  HomeResponse? _home;
  HomeResponse? get home => _home;

  AppServicesResponse? _appServicesResponse;
  AppServicesResponse? get appServicesResponse => _appServicesResponse;

  final List<ServiceProviders> _shopsList = [];
  List<ServiceProviders> get shopsList => _shopsList;

  final List<ServiceCategories> _categoriesShopsList = [];
  List<ServiceCategories> get categoriesShopsList => _categoriesShopsList;

  final List<ServiceCategories> _categoriesList = [];
  List<ServiceCategories> get categoriesList => _categoriesList;

  final List<SpProducts> _cartList = [];
  List<SpProducts> get cartList => _cartList;

  int _itemInCart = 0;
  int get itemInCart => _itemInCart;

  double _subTotal = 0;
  double get subTotal => _subTotal;

  int page = 0;
  bool hasMore = true;

  int tabSelected = 0;
  String catIdSelected = '';

  bool? getData;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  bool _newItem = false;

  void setTabSelected(
      int value, String catId, String serviceId, String locationId) {
    tabSelected = value;
    catIdSelected = catId;
    hasMore = true;
    page = 0;
    _shopsList.clear();
    getShops(serviceId, locationId);
    notifyListeners();
  }

  void addToCart(SpProducts product, ServiceProviders serviceProvider) {
    for (var shopElement in _shopsList) {
      if (shopElement == serviceProvider) {
        if (_cartList.isEmpty) {
          addNewItem(shopElement, product);
        } else {
          addItemQuantityInCart(product);
          if (_newItem) {
            addNewItem(shopElement, product);
            _newItem = false;
          }
        }
      }
    }
  }

  void addItemQuantityInCart(SpProducts product) {
    for (int i = 0; i < _cartList.length; i++) {
      if (_cartList[i].id == product.id &&
          _cartList[i].priceWithExtra == product.priceWithExtra) {
        _cartList[i].quantityInCart += _cartList[i].quantityToCart;
        for (int j = 0; j < _cartList[i].quantityToCart; j++) {
          _itemInCart += 1;
          _subTotal += product.priceWithExtra != null
              ? double.parse(product.priceWithExtra!)
              : double.parse(product.price.toString());
        }
        product.quantityToCart = 1;
        notifyListeners();
        break;
      }

      if (i + 1 == _cartList.length) {
        _newItem = true;
      }
    }
  }

  void decreaseItemQuantityInCart(SpProducts product) {
    for (int i = 0; i < _cartList.length; i++) {
      if (_cartList[i].id == product.id &&
          _cartList[i].priceWithExtra == product.priceWithExtra) {
        _cartList[i].quantityInCart -= _cartList[i].quantityToCart;
        for (int j = 0; j < _cartList[i].quantityToCart; j++) {
          _itemInCart -= 1;
          _subTotal -= product.priceWithExtra != null
              ? double.parse(product.priceWithExtra!)
              : double.parse(product.price.toString());
        }
        product.quantityToCart = 1;
        notifyListeners();
        break;
      }
      if (i + 1 == _cartList.length && _cartList[i].id != product.id) {
        _newItem = true;
      }
    }
  }

  void addNewItem(ServiceProviders shopElement, SpProducts product) {
    product.quantityInCart = product.quantityToCart;

    for (int j = 0; j < product.quantityToCart; j++) {
      _itemInCart += 1;
      _subTotal += product.priceWithExtra != null
          ? double.parse(product.priceWithExtra!)
          : double.parse(product.price.toString());
    }
    product.quantityToCart = 1;

    shopElement.cart.add(SpProducts(
        extraHelpList: product.extraHelpList,
        extraList: product.extraList,
        quantityInCart: product.quantityInCart,
        quantityToCart: product.quantityToCart,
        additionalShippingCharge: product.additionalShippingCharge,
        allowCustomerReviews: product.allowCustomerReviews,
        approvedRatingSum: product.approvedRatingSum,
        approvedTotalReviews: product.approvedTotalReviews,
        brandName: product.brandName,
        categoryGuid: product.categoryGuid,
        categoryName: product.categoryName,
        disableBuyButton: product.disableBuyButton,
        disableWishlistButton: product.disableBuyButton,
        displayOrder: product.displayOrder,
        foreignPrice: product.foreignPrice,
        fullHTMLDescription: product.fullHTMLDescription,
        id: product.id,
        markAsNew: product.markAsNew,
        name: product.name,
        oldPrice: product.oldPrice,
        orderMaximumQuantity: product.orderMaximumQuantity,
        orderMinimumQuantity: product.orderMinimumQuantity,
        price: product.price,
        priceWithExtra: product.priceWithExtra,
        productAttAsJson: product.productAttAsJson,
        productDetails: product.productDetails,
        productimgurl: product.productimgurl,
        shortDescription: product.shortDescription));
    _cartList.add(SpProducts(
        extraHelpList: product.extraHelpList,
        extraList: product.extraList,
        quantityInCart: product.quantityInCart,
        quantityToCart: product.quantityToCart,
        additionalShippingCharge: product.additionalShippingCharge,
        allowCustomerReviews: product.allowCustomerReviews,
        approvedRatingSum: product.approvedRatingSum,
        approvedTotalReviews: product.approvedTotalReviews,
        brandName: product.brandName,
        categoryGuid: product.categoryGuid,
        categoryName: product.categoryName,
        disableBuyButton: product.disableBuyButton,
        disableWishlistButton: product.disableBuyButton,
        displayOrder: product.displayOrder,
        foreignPrice: product.foreignPrice,
        fullHTMLDescription: product.fullHTMLDescription,
        id: product.id,
        markAsNew: product.markAsNew,
        name: product.name,
        oldPrice: product.oldPrice,
        orderMaximumQuantity: product.orderMaximumQuantity,
        orderMinimumQuantity: product.orderMinimumQuantity,
        price: product.price,
        priceWithExtra: product.priceWithExtra,
        productAttAsJson: product.productAttAsJson,
        productDetails: product.productDetails,
        productimgurl: product.productimgurl,
        shortDescription: product.shortDescription));
    notifyListeners();
  }

  void removeItemFromCart(ServiceProviders shopElement, SpProducts product) {
    _cartList.remove(product);
    shopElement.cart.remove(product);
    _itemInCart -= product.quantityInCart;
    for (int i = 0; i < product.quantityInCart; i++) {
      _subTotal -= product.priceWithExtra != null
          ? double.parse(product.priceWithExtra!)
          : double.parse(product.price.toString());
    }
    notifyListeners();
  }

  void getCart(ServiceProviders serviceProvider) {
    _cartList.clear();
    _itemInCart = 0;
    _subTotal = 0;
    for (var shopElement in _shopsList) {
      if (shopElement == serviceProvider) {
        for (var element in shopElement.cart) {
          _cartList.add(element);
          for (int i = 0; i < element.quantityInCart; i++) {
            _itemInCart++;
            _subTotal += element.priceWithExtra != null
                ? double.parse(element.priceWithExtra!)
                : double.parse(element.price.toString());
          }
        }
        notifyListeners();
      }
    }
  }

  Future<void> getHome(
      {bool firstRequest = false, VoidCallback? moveTohome}) async {
    getData = null;
    _isLoading = true;
    try {
      final result = await InternetAddress.lookup('example.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        http.Response apiResponse = await homeRepo.getHome();
        _isLoading = true;
        if (json.decode(apiResponse.body)['statusCode'] == 200) {
          log("Get Home Success");
          getData = true;
          _home = HomeResponse.fromJson(json.decode(apiResponse.body));
          _isLoading = false;
          moveTohome!();
          notifyListeners();
        } else {
          getData = null;
          _isLoading = false;
          notifyListeners();
          log("Get Home Failed");
        }
      }
    } on SocketException catch (_) {
      getData = null;
      _isLoading = false;
      notifyListeners();
      log("Get Home Failed");
    }
  }

  Future refresh(String serviceId, String locationId) async {
    _isLoading = false;
    hasMore = true;
    page = 0;

    _shopsList.clear();

    getShops(serviceId, locationId);

    notifyListeners();
  }

  clear() {
    hasMore = true;
    page = 0;
    _shopsList.clear();
    _cartList.clear();
    tabSelected = 0;
    catIdSelected = '';
  }

  Future getShops(String serviceId, String locationId,
      {bool showLoading = false}) async {
    getData = null;

    _isLoading = true;

    if (showLoading) {
      notifyListeners();
    }

    try {
      final result = await InternetAddress.lookup('example.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        http.Response apiResponse =
            await homeRepo.getShops(serviceId, locationId, page, catIdSelected);
        _isLoading = true;
        if (json.decode(apiResponse.body)['statusCode'] == 200) {
          log("Get Shops Success");
          getData = true;
          _appServicesResponse =
              AppServicesResponse.fromJson(json.decode(apiResponse.body));
          if (_appServicesResponse!.result!.serviceProviders != null &&
              _appServicesResponse!.result!.serviceProviders!.length < 5) {
            hasMore = false;
          }

          if (_appServicesResponse!.result!.serviceProviders != null) {
            _shopsList.addAll(_appServicesResponse!.result!.serviceProviders!);
          }
          if (page == 0 &&
              _appServicesResponse!.result!.serviceCategories != null) {
            _categoriesShopsList.clear();

            _categoriesShopsList.add(ServiceCategories(name: 'الكل', id: ''));

            _categoriesShopsList
                .addAll(_appServicesResponse!.result!.serviceCategories!);
          }

          page++;

          _isLoading = false;
          notifyListeners();
        } else {
          getData = null;
          _isLoading = false;
          notifyListeners();
          log("Get Shops Failed");
        }
      }
    } on SocketException catch (_) {
      getData = null;
      _isLoading = false;
      notifyListeners();
      log("Get Shops Failed");
    }
  }

  Future getCategories(String serviceId, String locationId) async {
    getData = null;
    _isLoading = true;
    _categoriesList.clear();

    try {
      final result = await InternetAddress.lookup('example.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        http.Response apiResponse = await homeRepo.getCategories(
            serviceId, locationId, page, catIdSelected);
        _isLoading = true;
        if (json.decode(apiResponse.body)['statusCode'] == 200) {
          log("Get Categories Success");
          getData = true;
          _appServicesResponse =
              AppServicesResponse.fromJson(json.decode(apiResponse.body));
          if (_appServicesResponse!.result!.serviceCategories != null) {
            _categoriesList
                .addAll(_appServicesResponse!.result!.serviceCategories!);
          }
          _isLoading = false;
          notifyListeners();
        } else {
          getData = null;
          _isLoading = false;
          notifyListeners();
          log("Get Categories Failed");
        }
      }
    } on SocketException catch (_) {
      getData = null;
      _isLoading = false;
      notifyListeners();
      log("Get Categories Failed");
    }
  }
}
