import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

import '../../../../controllers/provider/address_provider.dart';

class AddLocation extends StatefulWidget {
  const AddLocation({super.key});

  @override
  State<AddLocation> createState() => _AddLocationState();
}

class _AddLocationState extends State<AddLocation> {
  GoogleMapController? controller;
  final Completer<GoogleMapController> _controller = Completer();
  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(30.045745, 31.224259),
    zoom: 12,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 200,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(2),
      ),
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          GoogleMap(
            mapType: MapType.normal,
            compassEnabled: false,
            mapToolbarEnabled: false,
            myLocationButtonEnabled: false,
            zoomControlsEnabled: false,
            markers: Provider.of<AddressProvider>(context, listen: true)
                        .bottomSheetMarker !=
                    null
                ? {
                    Provider.of<AddressProvider>(context, listen: true)
                        .bottomSheetMarker!
                  }
                : {},
            onTap: (loc) {
              Provider.of<AddressProvider>(context, listen: false)
                  .pinLocation(loc, _controller);
            },
            initialCameraPosition: _kGooglePlex,
            onMapCreated: (GoogleMapController controller) {
              if (!_controller.isCompleted) {
                _controller.complete(controller);
              }
            },
            gestureRecognizers: <Factory<OneSequenceGestureRecognizer>>{}
              ..add(
                Factory<ScaleGestureRecognizer>(() =>
                    ScaleGestureRecognizer()..onStart = (scaleStartDetails) {}),
              )
              ..add(
                Factory<VerticalDragGestureRecognizer>(() =>
                    VerticalDragGestureRecognizer()
                      ..onDown = (dragDownDetails) {}),
              )
              ..add(
                Factory<HorizontalDragGestureRecognizer>(() =>
                    HorizontalDragGestureRecognizer()..onDown = (details) {}),
              ),
          ),
          ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.orange),
            ),
            onPressed: () {
              Provider.of<AddressProvider>(context, listen: false)
                  .determinePosition(_controller);
            },
            child: Text(
              'Get  Location',
              style: Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .copyWith(fontWeight: FontWeight.bold, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
