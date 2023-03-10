import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../../models/register_model.dart';
import '../../models/register_response_model.dart';
import '../repo/register_repo.dart';

class RegisterProvider extends ChangeNotifier {
  final RegisterRepo registerRepo;

  RegisterProvider({required this.registerRepo});

  RegisterResponseModel? _registerData;
  RegisterResponseModel? get registerData => _registerData;

  bool? getData;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<void> register(
      {bool firstRequest = false, RegisterModel? registerModel}) async {
    getData = null;
    _isLoading = true;
    try {
      final result = await InternetAddress.lookup('example.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        http.Response apiResponse = await registerRepo.register(RegisterModel(
          firstName: "Ahmad",
          lastName: "Abood",
          password: "5555555",
          cityGuid: "4995D82E-3203-49C0-A2D2-1DF436A2D747",
          primaryPhoneNum: "2684933",
          countryGuid: "51585ED2-1396-45A3-AE28-3D7DD2FACB05",
          subscribeToNewsletter: true,
          userName: "Ahmad1997",
        ));
        _isLoading = true;
        if (apiResponse.statusCode == 200) {
          log("Register Success");
          getData = true;
          _registerData =
              RegisterResponseModel.fromJson(json.decode(apiResponse.body));
          _isLoading = false;
          notifyListeners();
        } else {
          getData = null;
          _isLoading = false;
          notifyListeners();
          log("Register Failed");
        }
      }
    } on SocketException catch (_) {
      getData = null;
      _isLoading = false;
      notifyListeners();
      log("Register Failed");
    }
  }
}
