import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../../../../../../../../../core/widgets/loading_alert_dialog.dart';
import '../../../../../../../../../core/widgets/show_dialog.dart';
import '../../models/checkout_model.dart';
import '../repo/checkout_repo.dart';

class CheckoutProvider extends ChangeNotifier {
  final CheckoutRepo checkoutRepo;

  CheckoutProvider({required this.checkoutRepo});

  bool? getData;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<void> checkout(CheckoutModel checkoutModel,
      {bool firstRequest = false,
      VoidCallback? stopLoading,
      String? token,
      BuildContext? context}) async {
    getData = null;
    loading(context!);
    try {
      final result = await InternetAddress.lookup('example.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        http.Response apiResponse = await checkoutRepo.checkout(token!);
        if (apiResponse.statusCode == 200) {
          log("Checkout Success");
          getData = true;
          _isLoading = false;
          stopLoading!();
          notifyListeners();
        } else {
          getData = null;
          _isLoading = false;
          stopLoading!();
          // ignore: use_build_context_synchronously
          showCustomDialog(
              context, json.decode(apiResponse.body)['errorMessage'] ?? '');
          notifyListeners();
          log("Checkout Failed");
        }
      }
    } on SocketException catch (_) {
      getData = null;
      _isLoading = false;
      stopLoading!();
      showCustomDialog(context, "Check your internet and try again...");
      notifyListeners();
      log("Checkout Failed");
    }
  }
}
