import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../../../../../../../../../../../../core/widgets/loading_alert_dialog.dart';
import '../../models/order_model.dart';
import '../repo/order_repo.dart';

class OrdersProvider extends ChangeNotifier {
  final OrdersRepo orderRepo;

  OrdersProvider({required this.orderRepo});

  OrderResponseModel? _ordersResponse;
  OrderResponseModel? get ordersResponse => _ordersResponse;

  List<Order> _ordersList = [];
  List<Order>? get ordersList => _ordersList;

  int page = 0;
  bool hasMore = true;

  bool? getData;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  clear() {
    hasMore = true;
    page = 0;
    _ordersList.clear();
  }

  Future getOrders(String serviceId, String token,
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
            await orderRepo.getOrders(serviceId, token, page);
        _isLoading = true;
        if (json.decode(apiResponse.body)['statusCode'] == 200) {
          page++;
          log("Get Orders Success");
          if (showLoading) {
            closeLoading!();
          }
          getData = true;
          _ordersResponse =
              OrderResponseModel.fromJson(json.decode(apiResponse.body));
          if (page == 0 && _ordersResponse!.result!.items != null) {
            _ordersList = _ordersResponse!.result!.items!;
          } else {
            _ordersList.addAll(_ordersResponse!.result!.items!);
          }
          if (_ordersResponse!.result!.items != null &&
              _ordersResponse!.result!.items!.length < 10) {
            hasMore = false;
          }
          _isLoading = false;
          notifyListeners();
        } else if (json.decode(apiResponse.body)['statusCode'] == 204) {
          getData = null;
          _isLoading = false;
          notifyListeners();
          log("Get Orders Is Empty");
        } else {
          getData = null;
          _isLoading = false;
          notifyListeners();
          log("Get Orders Failed");
        }
      }
    } on SocketException catch (_) {
      getData = null;
      _isLoading = false;
      notifyListeners();
      log("Get Orders Failed");
    }
  }
}
