import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:nasak/features/dashboard/screens/countries/models/countries_model.dart';

import '../../models/app_services_model.dart';
import '../../models/home_model.dart';
import '../../views/screens/checkout/models/checkout_model.dart';
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

  List<OrderItems> _orderItemsList = [];
  List<OrderItems> get orderItemsList => _orderItemsList;

  Currencies? _currency;
  Currencies? get currency => _currency;

  bool _isPickup = false;
  bool? get isPickup => _isPickup;

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
  bool _addQuantity = false;

  List<ProductAttrbutes> _productAttrbutes = [];

  void setOrderItemsList(List<SpProducts> cart) {
    _orderItemsList = [];
    for (var item in cart) {
      _productAttrbutes = [];

      if (item.productDetails != null) {
        for (var detail in item.productDetails!) {
          _productAttrbutes.add(ProductAttrbutes(
              groupGuid: detail.groupguid,
              selectedOptionGuid: detail.optionguid));
        }
      }
      _orderItemsList.add(OrderItems(
          finalPrice: item.priceWithExtra != null
              ? (double.parse(item.priceWithExtra.toString()) *
                      item.quantityInCart)
                  .toString()
              : '${double.parse(item.price!) * double.parse(item.quantityInCart.toString())}',
          isSpecialOfferItem: false,
          priceIncl: item.priceWithExtra ?? item.price,
          productAttrbutes: _productAttrbutes,
          productGuid: item.id,
          quantity: item.quantityInCart.toString(),
          unitPrice: item.price));
    }
    notifyListeners();
  }

  void setCurrency(Countries country) {
    for (var element in _home!.result!.currencies!) {
      if (element.id == country.currencyId) {
        _currency = element;
      }
    }
  }

  void setIsPickup(bool value) {
    _isPickup = value;
    notifyListeners();
  }

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
    if (serviceProvider.cart.isEmpty) {
      addNewItem(serviceProvider, product);
    } else {
      increaseItemQuantityInCart(product, serviceProvider);
      if (_newItem) {
        addNewItem(serviceProvider, product);
        _newItem = false;
      }
    }
  }

  void increaseItemQuantityInCart(
    SpProducts product,
    ServiceProviders shopElement,
  ) {
    _addQuantity = false;
    for (int i = 0; i < shopElement.cart.length; i++) {
      if (product.productDetails != null &&
          product.productDetails!.isNotEmpty) {
        if (shopElement.cart[i].id == product.id &&
            shopElement.cart[i].priceWithExtra == product.priceWithExtra &&
            shopElement.cart[i].productDetails!.length ==
                product.productDetails!.length) {
          for (int j = 0; j < product.productDetails!.length; j++) {
            if (shopElement.cart[i].productDetails![j] !=
                product.productDetails![j]) {
              break;
            } else if (j + 1 == product.productDetails!.length) {
              _addQuantity = true;
              shopElement.cart[i].quantityInCart += product.quantityToCart;
              for (int j = 0; j < product.quantityToCart; j++) {
                _itemInCart += 1;
                _subTotal += product.priceWithExtra != null
                    ? double.parse(product.priceWithExtra!)
                    : double.parse(product.price.toString());
              }
              product.quantityToCart = 1;
              notifyListeners();
              break;
            }
          }
        }
      } else {
        if (shopElement.cart[i].id == product.id &&
            shopElement.cart[i].priceWithExtra == product.priceWithExtra) {
          shopElement.cart[i].quantityInCart += product.quantityToCart;
          for (int j = 0; j < product.quantityToCart; j++) {
            _itemInCart += 1;
            _subTotal += product.priceWithExtra != null
                ? double.parse(product.priceWithExtra!)
                : double.parse(product.price.toString());
          }
          product.quantityToCart = 1;
          notifyListeners();
          break;
        }
      }

      if (i + 1 == shopElement.cart.length && !_addQuantity) {
        _newItem = true;
      }
    }
  }

  void decreaseItemQuantityInCart(
      SpProducts product, ServiceProviders shopElement) {
    for (int i = 0; i < shopElement.cart.length; i++) {
      if (shopElement.cart[i].id == product.id &&
          shopElement.cart[i].priceWithExtra == product.priceWithExtra &&
          shopElement.cart[i].productDetails! == product.productDetails!) {
        shopElement.cart[i].quantityInCart -=
            shopElement.cart[i].quantityToCart;
        _itemInCart -= 1;
        _subTotal -= product.priceWithExtra != null
            ? double.parse(product.priceWithExtra!)
            : double.parse(product.price.toString());
        product.quantityToCart = 1;
        notifyListeners();
        break;
      }
      if (i + 1 == shopElement.cart.length &&
          shopElement.cart[i].id != product.id) {
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

    List<ProductDetails> productDetails = [];

    if (product.productDetails != null) {
      for (var element in product.productDetails!) {
        productDetails.add(ProductDetails(
            isSelected: element.isSelected,
            affectPrice: element.affectPrice,
            attrType: element.attrType,
            groupName: element.groupName,
            groupguid: element.groupguid,
            isExtraPrice: element.isExtraPrice,
            isFixedPrice: element.isFixedPrice,
            isavaliable: element.isavaliable,
            optionName: element.optionName,
            optionPriceAdj: element.optionPriceAdj,
            optionguid: element.optionguid));
      }
    }
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
        productDetails: productDetails,
        productimgurl: product.productimgurl,
        shortDescription: product.shortDescription));

    notifyListeners();
  }

  void removeItemFromCart(ServiceProviders shopElement, SpProducts product) {
    {
      shopElement.cart.removeWhere(
        (element) => (element.id == product.id &&
            element.priceWithExtra == product.priceWithExtra &&
            element.productDetails == product.productDetails),
      );
    }
    _itemInCart -= product.quantityInCart;

    for (int i = 0; i < product.quantityInCart; i++) {
      _subTotal -= product.priceWithExtra != null
          ? double.parse(product.priceWithExtra!)
          : double.parse(product.price.toString());
    }
    notifyListeners();
  }

  void getCart(ServiceProviders serviceProvider) {
    _itemInCart = 0;
    _subTotal = 0;
    for (var element in serviceProvider.cart) {
      for (int i = 0; i < element.quantityInCart; i++) {
        _itemInCart++;
        _subTotal += element.priceWithExtra != null
            ? double.parse(element.priceWithExtra!)
            : double.parse(element.price.toString());
      }
    }
    notifyListeners();
  }

  String getExtras(SpProducts product) {
    String extras = '';

    List<ProductDetails> productDetails = [];

    if (product.productDetails != null) {
      for (int i = 0; i < product.productDetails!.length; i++) {
        if (product.productDetails![i].isSelected) {
          productDetails.add(product.productDetails![i]);
        }
      }

      for (int i = 0; i < productDetails.length; i++) {
        if (productDetails[i].isSelected) {
          if (i + 1 == productDetails.length) {
            extras += "${productDetails[i].optionName} ";
          } else {
            extras += "${productDetails[i].optionName} , ";
          }
        }
      }
    }

    return extras;
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
