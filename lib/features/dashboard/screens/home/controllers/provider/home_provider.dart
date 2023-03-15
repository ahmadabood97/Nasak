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

  int tabSelected = 0;

  bool? getData;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  void setTabSelected(int value) {
    tabSelected = value;
    _shopsList.clear();
    for (var element in _appServicesResponse!.result!.serviceProviders!) {
      element.serviceproviderCats!.split(',').forEach((catIdInShop) {
        if (catIdInShop.trim().toLowerCase() ==
            _appServicesResponse!.result!.serviceCategories![value].id!
                .trim()
                .toLowerCase()) {
          _shopsList.add(element);
        }
      });
    }
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
        if (apiResponse.statusCode == 200) {
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

  Future<void> getAppServices(
      {bool firstRequest = false,
      required String serviceId,
      required String locationId}) async {
    getData = null;
    _isLoading = true;

    try {
      final result = await InternetAddress.lookup('example.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        http.Response apiResponse =
            await homeRepo.getAppServices(serviceId, locationId);
        _isLoading = true;
        if (apiResponse.statusCode == 200) {
          log("Get AppServices Success");
          getData = true;
          _appServicesResponse =
              AppServicesResponse.fromJson(json.decode(apiResponse.body));
          if (_appServicesResponse!.result!.serviceProviders != null) {
            for (var element
                in _appServicesResponse!.result!.serviceProviders!) {
              element.serviceproviderCats!.split(',').forEach((catIdInShop) {
                if (catIdInShop.trim().toLowerCase() ==
                    _appServicesResponse!.result!.serviceCategories![0].id!
                        .trim()
                        .toLowerCase()) {
                  _shopsList.add(element);
                }
              });
            }
          }

          _isLoading = false;
          notifyListeners();
        } else {
          getData = null;
          _isLoading = false;
          notifyListeners();
          log("Get AppServices Failed");
        }
      }
    } on SocketException catch (_) {
      getData = null;
      _isLoading = false;
      notifyListeners();
      log("Get AppServices Failed");
    }
  }
}
