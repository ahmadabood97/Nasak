import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../../../../../../../../../../../../core/widgets/loading_alert_dialog.dart';
import '../../models/order_details_model.dart';
import '../repo/order_details_repo.dart';

class OrderDetailsProvider extends ChangeNotifier {
  final OrderDetailsRepo orderDetailsRepo;

  OrderDetailsProvider({required this.orderDetailsRepo});

  OrderDetailsResponseModel? _orderDetailsResponse;
  OrderDetailsResponseModel? get orderDetailsResponse => _orderDetailsResponse;

  bool? getData;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future getOrderDetails(String orderId,
      {bool showLoading = false,
      VoidCallback? closeLoading,
      BuildContext? context}) async {
    getData = null;
    _isLoading = true;
    if (showLoading) {
      loading(context!);
    }
    try {
      final result = await InternetAddress.lookup('example.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        http.Response apiResponse =
            await orderDetailsRepo.getOrderDetails(orderId);
        _isLoading = true;
        if (json.decode(apiResponse.body)['statusCode'] == 200) {
          log("Get Orders Details Success");
          if (showLoading) {
            closeLoading!();
          }
          getData = true;
          _orderDetailsResponse =
              OrderDetailsResponseModel.fromJson(json.decode(apiResponse.body));
          _isLoading = false;
          notifyListeners();
        } else {
          getData = null;
          _isLoading = false;
          notifyListeners();
          log("Get Orders Details Failed");
        }
      }
    } on SocketException catch (_) {
      getData = null;
      _isLoading = false;
      notifyListeners();
      log("Get Orders Details Failed");
    }
  }
}
