import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../models/login_response_model.dart';
import '../repo/login_repo.dart';

class LoginProvider extends ChangeNotifier {
  final LoginRepo loginRepo;

  LoginProvider({required this.loginRepo});

  LoginResponseModel? _loginData;
  LoginResponseModel? get loginData => _loginData;

  bool? getData;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<void> login({bool firstRequest = false}) async {
    getData = null;
    _isLoading = true;
    try {
      final result = await InternetAddress.lookup('example.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        http.Response apiResponse = await loginRepo.login();
        _isLoading = true;
        if (apiResponse.statusCode == 200) {
          log("Login Success");
          getData = true;
          _loginData =
              LoginResponseModel.fromJson(json.decode(apiResponse.body));
          _isLoading = false;
          notifyListeners();
        } else {
          getData = null;
          _isLoading = false;
          notifyListeners();
          log("Login Failed");
        }
      }
    } on SocketException catch (_) {
      getData = null;
      _isLoading = false;
      notifyListeners();
      log("Login Failed");
    }
  }
}
