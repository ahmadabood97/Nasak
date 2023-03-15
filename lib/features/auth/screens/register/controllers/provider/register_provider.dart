import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../../../../../../core/widgets/loading_alert_dialog.dart';
import '../../../../../../core/widgets/show_dialog.dart';
import '../../../../../dashboard/screens/countries/controllers/provider/countries_provider.dart';
import '../../models/register_model.dart';
import '../../models/register_response_model.dart';
import '../repo/register_repo.dart';

class RegisterProvider extends ChangeNotifier {
  final RegisterRepo registerRepo;
  CountriesProvider countriesProvider;

  RegisterProvider(
      {required this.registerRepo, required this.countriesProvider});

  RegisterResponseModel? _registerData;
  RegisterResponseModel? get registerData => _registerData;

  bool? getData;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  TextEditingController get firstNameController => _firstNameController;
  TextEditingController get lastNameController => _lastNameController;
  TextEditingController get userNameController => _userNameController;
  TextEditingController get passwordController => _passwordController;
  TextEditingController get phoneController => _phoneController;

  List<String> countryDropdownList = [];
  List<String> citiesDropdownList = [];
  List<String> reigonDropdownList = [];

  int countrySelectedIndex = 0;
  int citySelectedIndex = 0;
  int reigonSelectedIndex = 0;

  String countryId = '';
  String cityId = '';
  String reigonId = '';

  String countrySelectedValue = '';
  String citySelectedValue = '';
  String reigonSelectedValue = '';
  bool subscribeToNewsletter = false;

  void setCountryCityReigonId() {
    for (var element in countriesProvider.countries!.result!.countries!) {
      if (element.name == countrySelectedValue) {
        countryId = element.id!;
      }
    }
    if (countriesProvider.countries!.result!.countries![countrySelectedIndex]
        .cities!.isNotEmpty) {
      for (var element in countriesProvider
          .countries!.result!.countries![countrySelectedIndex].cities!) {
        if (element.name == citySelectedValue) {
          cityId = element.id!;
        }
      }
      if (countriesProvider.countries!.result!.countries![countrySelectedIndex]
          .cities![citySelectedIndex].regions!.isNotEmpty) {
        for (var element in countriesProvider
            .countries!
            .result!
            .countries![countrySelectedIndex]
            .cities![citySelectedIndex]
            .regions!) {
          if (element.name == reigonSelectedValue) {
            reigonId = element.id!;
          }
        }
      }
    }
    notifyListeners();
  }

  void setSubscribeToNewsletter() {
    subscribeToNewsletter = !subscribeToNewsletter;
    notifyListeners();
  }

  void clearCountryList() {
    countryDropdownList = [];
    countrySelectedValue = '';
    countrySelectedIndex = 0;
    notifyListeners();
  }

  void clearCitiesList() {
    citiesDropdownList = [];
    citySelectedValue = '';
    citySelectedIndex = 0;
    cityId = '';
    notifyListeners();
  }

  void clearReigonList() {
    reigonDropdownList = [];
    reigonSelectedValue = '';
    reigonSelectedIndex = 0;
    reigonId = '';
    notifyListeners();
  }

  void setCountrySelectedIndex(int index, String value) {
    countrySelectedIndex = index;
    countrySelectedValue = value;
    notifyListeners();
  }

  void setCitySelectedIndex(int index, String value) {
    citySelectedIndex = index;
    citySelectedValue = value;
    notifyListeners();
  }

  void setReigonSelectedIndex(int index, String value) {
    reigonSelectedIndex = index;
    reigonSelectedValue = value;
    notifyListeners();
  }

  void addToCityDropdownList(String value) {
    citiesDropdownList.add(value);
    notifyListeners();
  }

  void addToReigonDropdownList(String value) {
    reigonDropdownList.add(value);
    notifyListeners();
  }

  Future<void> register(
      {bool firstRequest = false,
      RegisterModel? registerModel,
      VoidCallback? moveToDashboard,
      VoidCallback? stopLoading,
      BuildContext? context}) async {
    getData = null;
    loading(context!);
    try {
      final result = await InternetAddress.lookup('example.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        log(countryId);
        log(cityId);
        log(reigonId);

        http.Response apiResponse = await registerRepo.register(RegisterModel(
          firstName: firstNameController.text.trim(),
          lastName: lastNameController.text.trim(),
          password: passwordController.text.trim(),
          cityGuid: cityId,
          primaryPhoneNum: phoneController.text.trim(),
          countryGuid: countryId,
          regionGuid: reigonId,
          subscribeToNewsletter: subscribeToNewsletter,
          userName: userNameController.text.trim(),
        ));
        _isLoading = true;
        if (json.decode(apiResponse.body)['statusCode'] == 200) {
          log("Register Success");

          getData = true;
          _registerData = RegisterResponseModel.fromJson(
              json.decode(apiResponse.body)['result']);
          _isLoading = false;
          _passwordController.clear();
          _phoneController.clear();
          _userNameController.clear();
          _lastNameController.clear();
          _firstNameController.clear();
          moveToDashboard!();
          registerRepo.saveUserDataBySharedPref(_registerData!);
          log("Save token is :${_registerData!.authToken}");
          notifyListeners();
        } else {
          getData = null;
          _isLoading = false;
          stopLoading!();
          // ignore: use_build_context_synchronously
          showCustomDialog(
              context, json.decode(apiResponse.body)['errorMessage']);
          notifyListeners();
          log("Register Failed");
        }
      }
    } on SocketException catch (_) {
      getData = null;
      _isLoading = false;
      stopLoading!();
      showCustomDialog(context, "Check your internet and try again...");
      notifyListeners();
      log("Register Failed");
    }
  }

  dynamic getToken() {
    return registerRepo.getUserData();
  }
}
