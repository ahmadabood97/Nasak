import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:nasak/features/dashboard/screens/addresses/models/address_model.dart';
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

  final TextEditingController _addressNameCheckoutController =
      TextEditingController();
  final TextEditingController _addressExtraCheckoutController =
      TextEditingController();
  final TextEditingController _buildNameCheckoutController =
      TextEditingController();
  final TextEditingController _floorNumCheckoutController =
      TextEditingController();
  final TextEditingController _entranceNumCheckoutController =
      TextEditingController();
  final TextEditingController _firstNameCheckoutController =
      TextEditingController();
  final TextEditingController _lastNameCheckoutController =
      TextEditingController();
  final TextEditingController _emailCheckoutController =
      TextEditingController();
  final TextEditingController _phoneCheckoutController =
      TextEditingController();
  final TextEditingController _noteCheckoutController = TextEditingController();

  TextEditingController get firstNameCheckoutController =>
      _firstNameCheckoutController;
  TextEditingController get lastNameCheckoutController =>
      _lastNameCheckoutController;
  TextEditingController get emailCheckoutController => _emailCheckoutController;
  TextEditingController get phoneCheckoutController => _phoneCheckoutController;
  TextEditingController get noteCheckoutController => _noteCheckoutController;
  TextEditingController get addressNameCheckoutController =>
      _addressNameCheckoutController;
  TextEditingController get addressExtraCheckoutController =>
      _addressExtraCheckoutController;
  TextEditingController get buildNameCheckoutController =>
      _buildNameCheckoutController;
  TextEditingController get floorNumCheckoutController =>
      _floorNumCheckoutController;
  TextEditingController get entranceNumCheckoutController =>
      _entranceNumCheckoutController;

  Addersses? _adderss;
  Addersses? get address => _adderss;

  void setAddress(Addersses value) {
    _adderss = value;
    notifyListeners();
  }

  void clearControllers() {
    _entranceNumCheckoutController.clear();
    _floorNumCheckoutController.clear();
    _buildNameCheckoutController.clear();
    _addressExtraCheckoutController.clear();
    _addressNameCheckoutController.clear();
    _firstNameCheckoutController.clear();
    _lastNameCheckoutController.clear();
    _emailCheckoutController.clear();
    _phoneCheckoutController.clear();
    _emailCheckoutController.clear();
  }

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
        log(json.encode(checkoutModel.toJson()).toString());

        http.Response apiResponse =
            await checkoutRepo.checkout(token!, checkoutModel);
        if (apiResponse.statusCode == 200) {
          log("Checkout Success");
          getData = true;
          _isLoading = false;
          stopLoading!();
          _adderss = null;

          clearControllers();
          notifyListeners();
        } else {
          getData = null;
          _isLoading = false;
          stopLoading!();
          // ignore: use_build_context_synchronously
          showCustomDialog(
              context,
              json.decode(apiResponse.body)['errorMessage'] ??
                  'There is an error');
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
