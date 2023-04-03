import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../models/app_services_model.dart';
import '../../models/home_model.dart';
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

  int page = 0;
  bool hasMore = true;

  int tabSelected = 0;
  String catIdSelected = '';

  bool? getData;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

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

  Future getShops(String serviceId, String locationId) async {
    getData = null;
    _isLoading = true;

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
