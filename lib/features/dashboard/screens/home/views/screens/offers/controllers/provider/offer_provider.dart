import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../../../../../../../../../../../../core/widgets/loading_alert_dialog.dart';
import '../../models/offers_model.dart';
import '../repo/offers_repo.dart';

class OffersProvider extends ChangeNotifier {
  final OffersRepo offerRepo;

  OffersProvider({required this.offerRepo});

  OffersResponseModel? _offersResponse;
  OffersResponseModel? get offersResponse => _offersResponse;

  List<Offer> _offersList = [];
  List<Offer>? get offersList => _offersList;

  int page = 0;
  bool hasMore = true;

  bool? getData;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  clear() {
    hasMore = true;
    page = 0;
    _offersList.clear();
  }

  Future getOffers(String serviceId, String locationId,
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
            await offerRepo.getOffers(serviceId, locationId, page);
        _isLoading = true;
        if (json.decode(apiResponse.body)['statusCode'] == 200) {
          page++;

          log("Get Offers Success");

          if (showLoading) {
            closeLoading!();
          }
          getData = true;

          _offersResponse =
              OffersResponseModel.fromJson(json.decode(apiResponse.body));

          if (page == 0 && _offersResponse!.result!.items != null) {
            _offersList = _offersResponse!.result!.items!;
          } else {
            _offersList.addAll(_offersResponse!.result!.items!);
          }

          if (_offersResponse!.result!.items != null &&
              _offersResponse!.result!.items!.length < 10) {
            hasMore = false;
          }

          _isLoading = false;
          notifyListeners();
        } else {
          getData = null;
          _isLoading = false;
          notifyListeners();
          log("Get Offers Failed");
        }
      }
    } on SocketException catch (_) {
      getData = null;
      _isLoading = false;
      notifyListeners();
      log("Get Offers Failed");
    }
  }
}
