import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../../../../../core/widgets/loading_alert_dialog.dart';
import '../../../../../../core/widgets/show_dialog.dart';
import '../../models/favorite_model.dart';
import '../repo/favorite_repo.dart';

class FavoriteProvider extends ChangeNotifier {
  final FavoriteRepo favoriteRepo;

  FavoriteProvider({required this.favoriteRepo});

  FavoriteResponseModel? _favoriteData;
  FavoriteResponseModel? get favoriteData => _favoriteData;

  List<Items> _favoriteList = [];
  List<Items> get favoriteList => _favoriteList;

  bool? getData;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<void> getFavorites(
      {bool firstRequest = false,
      VoidCallback? stopLoading,
      VoidCallback? moveToFavoriteScreen,
      BuildContext? context,
      String? token}) async {
    getData = null;
    loading(context!);
    try {
      final result = await InternetAddress.lookup('example.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        http.Response apiResponse = await favoriteRepo.getFavorites(token!);
        if (json.decode(apiResponse.body)['statusCode'] == 200) {
          getData = true;
          _favoriteData =
              FavoriteResponseModel.fromJson(json.decode(apiResponse.body));

          _favoriteList = _favoriteData!.result!.items!;

          _isLoading = false;
          stopLoading!();
          if (moveToFavoriteScreen != null) {
            moveToFavoriteScreen();
          }
          log("Get Favorite Success");
          notifyListeners();
        } else if (json.decode(apiResponse.body)['statusCode'] == 204) {
          log(" Favorite is empty");

          if (moveToFavoriteScreen != null) {
            moveToFavoriteScreen();
          }
          stopLoading!();
        } else {
          getData = null;
          _isLoading = false;
          stopLoading!();
          notifyListeners();
          log("Get Favorite Failed");
        }
      }
    } on SocketException catch (_) {
      getData = null;
      _isLoading = false;
      stopLoading!();
      showCustomDialog(context, "Check your internet and try again...");
      notifyListeners();
      log("Get Favorite Failed");
    }
  }

  Future<void> addToFavorites(
      {bool firstRequest = false,
      VoidCallback? stopLoading,
      String? token,
      String? shopId,
      BuildContext? context}) async {
    getData = null;

    loading(context!);
    try {
      final result = await InternetAddress.lookup('example.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        http.Response apiResponse =
            await favoriteRepo.addToFavorites(shopId!, token!);
        if (json.decode(apiResponse.body)['statusCode'] == 200) {
          log("Add To Favorite Success");

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
          log("Add To Favorite Failed");
        }
      }
    } on SocketException catch (_) {
      getData = null;
      _isLoading = false;
      stopLoading!();
      showCustomDialog(context, "Check your internet and try again...");
      notifyListeners();
      log("Add To Favorite Failed");
    }
  }

  Future<void> deleteFromFavorites(
      {bool firstRequest = false,
      VoidCallback? stopLoading,
      String? token,
      String? shopId,
      BuildContext? context}) async {
    getData = null;

    loading(context!);
    try {
      final result = await InternetAddress.lookup('example.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        http.Response apiResponse =
            await favoriteRepo.deleteFromFavorites(shopId!, token!);
        if (json.decode(apiResponse.body)['statusCode'] == 200) {
          log("Delete From Favorite Success");
          _favoriteList
              .removeWhere((element) => element.serviceProviderId == shopId);
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
          log("Delete From Favorite Success");
        }
      }
    } on SocketException catch (_) {
      getData = null;
      _isLoading = false;
      stopLoading!();
      showCustomDialog(context, "Check your internet and try again...");
      notifyListeners();
      log("Delete From Favorite Success");
    }
  }
}
