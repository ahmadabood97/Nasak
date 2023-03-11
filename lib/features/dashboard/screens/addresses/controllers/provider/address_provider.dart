import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../../../../../core/widgets/loading_alert_dialog.dart';
import '../../../../../../core/widgets/show_dialog.dart';
import '../../models/address_model.dart';
import '../repo/address_repo.dart';

class AddressProvider extends ChangeNotifier {
  final AddressRepo addressRepo;

  AddressProvider({required this.addressRepo});

  AddressResponseModel? _addressData;
  AddressResponseModel? get addressData => _addressData;

  List<Addersses>? _addressList;
  List<Addersses>? get addressList => _addressList;

  bool? getData;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  // final TextEditingController _emailController = TextEditingController();
  // final TextEditingController _passwordController = TextEditingController();

  // TextEditingController get phoneController => _emailController;
  // TextEditingController get passwordController => _passwordController;

  Future<void> getAddress(
      {bool firstRequest = false,
      VoidCallback? stopLoading,
      BuildContext? context}) async {
    getData = null;

    loading(context!);
    try {
      final result = await InternetAddress.lookup('example.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        http.Response apiResponse = await addressRepo.getAddress();
        if (apiResponse.statusCode == 200) {
          log("Get Address Success");
          getData = true;
          _addressData =
              AddressResponseModel.fromJson(json.decode(apiResponse.body));
          _addressList = _addressData!.result!.addersses!;
          _isLoading = false;
          stopLoading!();
          notifyListeners();
        } else {
          getData = null;
          _isLoading = false;
          stopLoading!();
          // ignore: use_build_context_synchronously
          showCustomDialog(context, "Phone or password is wrong...");
          notifyListeners();
          log("Get Address Failed");
        }
      }
    } on SocketException catch (_) {
      getData = null;
      _isLoading = false;
      stopLoading!();
      showCustomDialog(context, "Check your internet and try again...");
      notifyListeners();
      log("Get Address Failed");
    }
  }
}
