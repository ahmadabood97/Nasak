import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../models/home_model.dart';
import '../repo/home_repo.dart';

class HomeProvider extends ChangeNotifier {
  final HomeRepo homeRepo;

  HomeProvider({required this.homeRepo});

  HomeResponse? _home;
  HomeResponse? get home => _home;

  bool? getData;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<void> getHome({bool firstRequest = false}) async {
    getData = null;
    _isLoading = true;

    try {
      final result = await InternetAddress.lookup('example.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        http.Response apiResponse = await homeRepo.getHome();
        _isLoading = true;
        if (apiResponse.statusCode == 200) {
          // Map map = json.decode(apiResponse.body);
          // log(map['topics'].toString());
          log("Get Home Success");
          getData = true;
          _home = HomeResponse.fromJson(json.decode(apiResponse.body));
          _isLoading = false;
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
}
