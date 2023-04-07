import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../../../../../../../../../../../../../../../core/widgets/loading_alert_dialog.dart';
import '../../models/about_model.dart';

import '../repo/about_repo.dart';

class AboutProvider extends ChangeNotifier {
  final AboutRepo aboutRepo;

  AboutProvider({required this.aboutRepo});

  AboutResponseModel? _aboutResponse;
  AboutResponseModel? get aboutResponse => _aboutResponse;

  TodayDeliveryPeroid _todayDeliveryPeroid =
      TodayDeliveryPeroid(startHour: '', endHour: '');
  TodayDeliveryPeroid? get todayDeliveryPeroid => _todayDeliveryPeroid;

  TodayDeliveryPeroid _tomorrowDeliveryPeroid =
      TodayDeliveryPeroid(startHour: '', endHour: '');
  TodayDeliveryPeroid? get tomorrowDeliveryPeroid => _tomorrowDeliveryPeroid;

  List<SpReviews> _reviewsList = [];
  List<SpReviews> get reviewsList => _reviewsList;

  List<SpOffers> _offersList = [];
  List<SpOffers> get offersList => _offersList;

  bool? getData;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  void clear() {
    _todayDeliveryPeroid = TodayDeliveryPeroid(startHour: '', endHour: '');
    _tomorrowDeliveryPeroid = TodayDeliveryPeroid(startHour: '', endHour: '');
    _reviewsList = [];
  }

  Future getAbout(String shopId,
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
        http.Response apiResponse = await aboutRepo.getAbout(shopId);
        _isLoading = true;
        if (json.decode(apiResponse.body)['statusCode'] == 200) {
          log("Get About Success");

          if (showLoading) {
            closeLoading!();
          }
          getData = true;

          _aboutResponse =
              AboutResponseModel.fromJson(json.decode(apiResponse.body));

          if (_aboutResponse!.result != null &&
              _aboutResponse!.result!.todayDeliveryPeroid != null) {
            _todayDeliveryPeroid = _aboutResponse!.result!.todayDeliveryPeroid!;
          }

          if (_aboutResponse!.result != null &&
              _aboutResponse!.result!.tomorrowDeliveryPeroid != null) {
            _tomorrowDeliveryPeroid =
                _aboutResponse!.result!.tomorrowDeliveryPeroid!;
          }

          if (_aboutResponse!.result != null &&
              _aboutResponse!.result!.spReviews != null) {
            _reviewsList = _aboutResponse!.result!.spReviews!;
          }

          if (_aboutResponse!.result != null &&
              _aboutResponse!.result!.spOffers != null) {
            _offersList = _aboutResponse!.result!.spOffers!;
          }

          _isLoading = false;
          notifyListeners();
        } else {
          getData = null;
          _isLoading = false;
          notifyListeners();
          log("Get About Failed");
        }
      }
    } on SocketException catch (_) {
      getData = null;
      _isLoading = false;
      notifyListeners();
      log("Get About Failed");
    }
  }
}
