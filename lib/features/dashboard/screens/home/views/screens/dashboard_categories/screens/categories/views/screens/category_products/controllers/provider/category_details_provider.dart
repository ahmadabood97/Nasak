import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:nasak/core/widgets/loading_alert_dialog.dart';

import '../../models/category_details.dart';
import '../repo/category_details_repo.dart';

class CategoryDetailsProvider extends ChangeNotifier {
  final CategoryDetailsRepo categoryDetailsRepo;

  CategoryDetailsProvider({required this.categoryDetailsRepo});

  CategoryDetailsResponse? _categoryDetailsResponse;
  CategoryDetailsResponse? get categoryDetailsResponse =>
      _categoryDetailsResponse;

  final List<SubCategories> _subCategoriesList = [];
  List<SubCategories> get subCategoriesList => _subCategoriesList;

  final List<CatProducts> _catProductsList = [];
  List<CatProducts> get catProductsList => _catProductsList;

  int page = 0;
  bool hasMore = true;

  int tabSelected = 0;
  String catIdSelected = '';

  bool? getData;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  void setTabSelected(int value, String catId, String locationId,
      String currencyId, String parentId) {
    tabSelected = value;
    catIdSelected = catId;
    hasMore = true;
    page = 0;
    _catProductsList.clear();
    getCategoryDetails(catId, locationId, currencyId, () {});
    notifyListeners();
  }

  Future refresh(
      String categoryId, String locationId, String currencyId) async {
    _isLoading = false;
    hasMore = true;
    page = 0;
    _catProductsList.clear();

    getCategoryDetails(categoryId, locationId, currencyId, () {});

    notifyListeners();
  }

  clear() {
    hasMore = true;
    tabSelected = 0;
    page = 0;
    _catProductsList.clear();
    _subCategoriesList.clear();
  }

  Future getCategoryDetails(String categoryId, String locationId,
      String currencyId, VoidCallback success,
      {VoidCallback? closeLoading, BuildContext? context}) async {
    getData = null;
    _isLoading = true;
    hasMore = true;

    try {
      if (context != null) {
        loading(context);
      }

      final result = await InternetAddress.lookup('example.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        http.Response apiResponse = await categoryDetailsRepo
            .getCategoryDetails(categoryId, locationId, currencyId, page);
        _isLoading = true;
        if (json.decode(apiResponse.body)['statusCode'] == 200) {
          if (context != null) {
            closeLoading!();
          }
          log("Get Category Details Success");
          getData = true;
          _categoryDetailsResponse =
              CategoryDetailsResponse.fromJson(json.decode(apiResponse.body));
          if ((_categoryDetailsResponse!.result!.catProducts != null &&
                  _categoryDetailsResponse!.result!.catProducts!.length < 10) ||
              (_categoryDetailsResponse!.result!.catProducts == null)) {
            hasMore = false;
          }

          if (page == 0 &&
              _categoryDetailsResponse!.result!.subCategories != null) {
            _subCategoriesList.clear();
            _subCategoriesList.add(SubCategories(name: 'الكل', id: categoryId));
            _subCategoriesList
                .addAll(_categoryDetailsResponse!.result!.subCategories!);
          }
          if (page == 0 &&
              _categoryDetailsResponse!.result!.catProducts != null) {
            _catProductsList.clear();

            _catProductsList
                .addAll(_categoryDetailsResponse!.result!.catProducts!);
          } else if (_categoryDetailsResponse!.result!.catProducts != null) {
            _catProductsList
                .addAll(_categoryDetailsResponse!.result!.catProducts!);
          }
          page++;

          success();
          _isLoading = false;
          notifyListeners();
        } else {
          getData = null;
          _isLoading = false;
          notifyListeners();
          log("Get Category Details Failed");
        }
      }
    } on SocketException catch (_) {
      getData = null;
      _isLoading = false;
      notifyListeners();
      log("Get Category Details Failed");
    }
  }
}
