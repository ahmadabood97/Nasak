import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:nasak/features/auth/screens/login/models/login_response_model.dart';
import '../../../../../../core/widgets/loading_alert_dialog.dart';
import '../../../../../../core/widgets/show_dialog.dart';
import '../../models/address_model.dart';
import '../repo/address_repo.dart';

class AddressProvider extends ChangeNotifier {
  final AddressRepo addressRepo;

  AddressProvider({required this.addressRepo});

  AddressResponseModel? _addressData;
  AddressResponseModel? get addressData => _addressData;

  List<Addersses> _addressList = [];
  List<Addersses> get addressList => _addressList;

  bool? getData;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  final TextEditingController _addressNameController = TextEditingController();
  final TextEditingController _addressExtraController = TextEditingController();
  final TextEditingController _buildNameController = TextEditingController();
  final TextEditingController _floorNumController = TextEditingController();
  final TextEditingController _entranceNumController = TextEditingController();

  TextEditingController get addressNameController => _addressNameController;
  TextEditingController get addressExtraController => _addressExtraController;
  TextEditingController get buildNameController => _buildNameController;
  TextEditingController get floorNumController => _floorNumController;
  TextEditingController get entranceNumController => _entranceNumController;

  double? _lat;
  double? _long;
  double? get lat => _lat;
  double? get long => _long;
  Position? position;

  Marker? _bottomSheetMarker;
  Marker? get bottomSheetMarker => _bottomSheetMarker;

  pinLocation(LatLng loc, Completer<GoogleMapController> controller) async {
    await controller.future.then((e) async {
      double zoom = await e.getZoomLevel();
      e.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
        target: loc,
        zoom: zoom,
      )));
    });
    _bottomSheetMarker = Marker(
        markerId: const MarkerId('bottomsheetloc'),
        position: loc,
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed));
    _lat = loc.latitude;
    _long = loc.longitude;

    log(_lat.toString());
    log(_long.toString());
    notifyListeners();
  }

  determinePosition(Completer<GoogleMapController> controller) async {
    LocationPermission permission;
    permission = await Geolocator.checkPermission();
    log(permission.toString());
    if (permission == LocationPermission.always) {
      position = await Geolocator.getCurrentPosition();
      log("lat : ${position!.latitude}");
      log("long : ${position!.longitude}");

      _lat = position!.latitude;
      _long = position!.longitude;

      _bottomSheetMarker = Marker(
          markerId: const MarkerId('bottomsheetloc'),
          position: LatLng(_lat!, _long!),
          icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed));

      await controller.future.then((e) async {
        double zoom = await e.getZoomLevel();
        e.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
          target: LatLng(_lat!, _long!),
          zoom: zoom,
        )));
      });
    }
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.deniedForever) {
        return Future.error('Location Not Available');
      }
    }
    notifyListeners();
  }

  Future<void> getAddress(
      {bool firstRequest = false,
      VoidCallback? stopLoading,
      BuildContext? context,
      String? token}) async {
    getData = null;

    loading(context!);
    try {
      final result = await InternetAddress.lookup('example.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        http.Response apiResponse = await addressRepo.getAddress(token!);
        if (json.decode(apiResponse.body)['statusCode'] == 200) {
          getData = true;
          _addressData =
              AddressResponseModel.fromJson(json.decode(apiResponse.body));
          _addressList = _addressData!.result!.addersses!;
          _isLoading = false;
          stopLoading!();
          log("Get Address Success");

          notifyListeners();
        } else {
          getData = null;
          _isLoading = false;
          stopLoading!();
          // ignore: use_build_context_synchronously
          showCustomDialog(context, "You dont have any address");
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

  Future<void> addAddress(
      {bool firstRequest = false,
      VoidCallback? stopLoading,
      LoginResponseModel? userData,
      Addersses? addersses,
      BuildContext? context}) async {
    getData = null;

    loading(context!);
    try {
      final result = await InternetAddress.lookup('example.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        http.Response apiResponse =
            await addressRepo.addAddress(userData!, addersses!);
        if (json.decode(apiResponse.body)['statusCode'] == 200) {
          log("Add Address Success");
          getData = true;
          Addersses address =
              Addersses.fromJson(json.decode(apiResponse.body)['result']);
          _addressList = [];
          _addressList.add(address);
          _isLoading = false;
          stopLoading!();
          stopLoading();
          clearControllers();
          notifyListeners();
        } else {
          getData = null;
          _isLoading = false;
          stopLoading!();
          // ignore: use_build_context_synchronously
          showCustomDialog(
              context, json.decode(apiResponse.body)['errorMessage'] ?? '');
          notifyListeners();
          log("Add Address Failed");
        }
      }
    } on SocketException catch (_) {
      getData = null;
      _isLoading = false;
      stopLoading!();
      showCustomDialog(context, "Check your internet and try again...");
      notifyListeners();
      log("Add Address Failed");
    }
  }

  void clearControllers() {
    _entranceNumController.clear();
    _floorNumController.clear();
    _buildNameController.clear();
    _addressExtraController.clear();
    _addressNameController.clear();
  }
}
