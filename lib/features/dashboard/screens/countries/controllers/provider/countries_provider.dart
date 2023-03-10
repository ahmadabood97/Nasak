import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../models/countries_model.dart';
import '../repo/countries_repo.dart';

class CountriesProvider extends ChangeNotifier {
  final CountriesRepo countriesRepo;

  CountriesProvider({required this.countriesRepo});

  CountriesResponse? _countries;
  CountriesResponse? get countries => _countries;

  bool? getData;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<void> getCountries({bool firstRequest = false}) async {
    getData = null;
    _isLoading = true;

    try {
      final result = await InternetAddress.lookup('example.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        http.Response apiResponse = await countriesRepo.getCountries();
        _isLoading = true;
        if (apiResponse.statusCode == 200) {
          // Map map = json.decode(apiResponse.body);
          // log(map['topics'].toString());
          log("Get Countries Success");
          getData = true;
          _countries =
              CountriesResponse.fromJson(json.decode(apiResponse.body));
          _isLoading = false;
          notifyListeners();
        } else {
          getData = null;
          _isLoading = false;
          notifyListeners();
          log("Get Countries Failed");
        }
      }
    } on SocketException catch (_) {
      getData = null;
      _isLoading = false;
      notifyListeners();
      log("Get Countries Failed");
    }
  }

  Future<void> saveLocation(Countries countries) async {
    countriesRepo.saveLocationBySharedPref(countries);
  }

  dynamic getLocationData() async {
    countriesRepo.getCountries();
  }
}
