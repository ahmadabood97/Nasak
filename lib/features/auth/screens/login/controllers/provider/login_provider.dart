import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../../../../../core/widgets/loading_alert_dialog.dart';
import '../../../../../../core/widgets/show_dialog.dart';
import '../../models/login_response_model.dart';
import '../repo/login_repo.dart';

class LoginProvider extends ChangeNotifier {
  final LoginRepo loginRepo;

  LoginProvider({required this.loginRepo});

  LoginResponseModel? _loginDate;
  LoginResponseModel? get loginData => _loginDate;

  bool? getData;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  TextEditingController get phoneController => _emailController;
  TextEditingController get passwordController => _passwordController;

  Future<void> login(
      {bool firstRequest = false,
      VoidCallback? moveToDashboard,
      VoidCallback? stopLoading,
      BuildContext? context}) async {
    getData = null;

    loading(context!);
    try {
      final result = await InternetAddress.lookup('example.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        http.Response apiResponse = await loginRepo.login(
            phoneController.text, passwordController.text);
        if (json.decode(apiResponse.body)['statusCode'] == 200) {
          log("Login Success");
          getData = true;
          _loginDate = LoginResponseModel.fromJson(
              json.decode(apiResponse.body)['result']);
          _isLoading = false;
          _passwordController.clear();
          moveToDashboard!();

          log("Save token is :${_loginDate!.authToken}");
          loginRepo.saveUserDataBySharedPref(_loginDate!);
          notifyListeners();
        } else {
          getData = null;
          _isLoading = false;
          stopLoading!();
          // ignore: use_build_context_synchronously
          showCustomDialog(
              context, json.decode(apiResponse.body)['errorMessage']);
          notifyListeners();
          log("Login Failed");
        }
      }
    } on SocketException catch (_) {
      getData = null;
      _isLoading = false;
      stopLoading!();
      showCustomDialog(context, "Check your internet and try again...");
      notifyListeners();
      log("Login Failed");
    }
  }

  Future<dynamic> getUserData() async {
    _loginDate = await loginRepo.getUserData();
    notifyListeners();
    return _loginDate;
  }

  void logout() {
    loginRepo.logout();
    _loginDate = null;
    notifyListeners();
  }
}
