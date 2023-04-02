import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'config/routes/app_routes.dart';
import 'core/utils/connect.dart';
import 'core/utils/di_container.dart' as di;
import 'features/auth/screens/login/controllers/provider/login_provider.dart';
import 'features/auth/screens/register/controllers/provider/register_provider.dart';
import 'features/auth/screens/register/controllers/repo/register_repo.dart';
import 'features/dashboard/screens/addresses/controllers/provider/address_provider.dart';
import 'features/dashboard/screens/countries/controllers/provider/countries_provider.dart';
import 'features/dashboard/screens/favorites/controllers/provider/favorite_provider.dart';
import 'features/dashboard/screens/home/controllers/provider/home_provider.dart';
import 'features/dashboard/screens/home/views/screens/categories/views/screens/category_products/controllers/provider/category_details_provider.dart';
import 'features/dashboard/screens/home/views/screens/dashboard_shops/screens/shops/screens/shop_details/controllers/provider/shop_provider.dart';
import 'features/splash/views/screens/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HttpOverrides.global = MyHttpOverrides();
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => di.sl<CountriesProvider>()),
        ChangeNotifierProvider(create: (context) => di.sl<HomeProvider>()),
        ChangeNotifierProvider(create: (context) => di.sl<LoginProvider>()),
        ChangeNotifierProvider(create: (context) => di.sl<AddressProvider>()),
        ChangeNotifierProvider(create: (context) => di.sl<RegisterProvider>()),
        ChangeNotifierProvider(create: (context) => di.sl<FavoriteProvider>()),
        ChangeNotifierProvider(create: (context) => di.sl<ShopProvider>()),
        ChangeNotifierProvider(
            create: (context) => di.sl<CategoryDetailsProvider>()),
        ChangeNotifierProxyProvider<CountriesProvider, RegisterProvider>(
            create: (context) => RegisterProvider(
                  registerRepo: di.sl<RegisterRepo>(),
                  countriesProvider:
                      Provider.of<CountriesProvider>(context, listen: false),
                ),
            update: (context, value, previous) => RegisterProvider(
                registerRepo: di.sl<RegisterRepo>(),
                countriesProvider:
                    Provider.of<CountriesProvider>(context, listen: false))),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
        onGenerateRoute: AppRoutes.onGenerateRoute,
      ),
    );
  }
}

// //Copyright (C) 2019 Potix Corporation. All Rights Reserved.
// //History: Tue Apr 24 09:29 CST 2019
// // Author: Jerry Chen

// import 'dart:math' as math;

// import 'package:flutter/material.dart';
// import 'package:scroll_to_index/scroll_to_index.dart';

// void main() => runApp(const MyApp());

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Scroll To Index Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: const MyHomePage(title: 'Scroll To Index Demo'),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   final String title;

//   const MyHomePage({Key? key, required this.title}) : super(key: key);

//   @override
//   MyHomePageState createState() => MyHomePageState();
// }

// class MyHomePageState extends State<MyHomePage> {
//   static const maxCount = 100;
//   static const double maxHeight = 1000;
//   final random = math.Random();
//   final scrollDirection = Axis.vertical;

//   late AutoScrollController controller;
//   late List<int> randomList;

//   @override
//   void initState() {
//     super.initState();
//     controller = AutoScrollController(
//         viewportBoundaryGetter: () =>
//             Rect.fromLTRB(0, 0, 0, MediaQuery.of(context).padding.bottom),
//         axis: scrollDirection);
//     randomList = [1, 2, 3, 4, 5, 6];
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title),
//         actions: [
//           IconButton(
//             onPressed: () {
//               setState(() => counter = randomList[0]);
//               _scrollToCounter();
//             },
//             icon: const Text('First'),
//           ),
//           IconButton(
//             onPressed: () {
//               setState(() => counter = randomList.length);
//               _scrollToCounter();
//             },
//             icon: const Text('Last'),
//           )
//         ],
//       ),
//       body: ListView(
//         scrollDirection: scrollDirection,
//         controller: controller,
//         children: randomList.map<Widget>((data) {
//           return Padding(
//             padding: const EdgeInsets.all(8),
//             child: _getRow(data, 150),
//           );
//         }).toList(),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _nextCounter,
//         tooltip: 'Increment',
//         child: Text(counter.toString()),
//       ),
//     );
//   }

//   int counter = 0;
//   Future _nextCounter() {
//     setState(() =>
//         counter >= randomList.length ? counter = 1 : counter = counter + 1);
//     return _scrollToCounter();
//   }

//   Future _scrollToCounter() async {
//     await controller.scrollToIndex(counter,
//         preferPosition: AutoScrollPosition.begin);
//     controller.highlight(counter);
//   }

//   Widget _getRow(int index, double height) {
//     return _wrapScrollTag(
//         index: index,
//         child: Container(
//           padding: const EdgeInsets.all(8),
//           alignment: Alignment.topCenter,
//           height: height,
//           decoration: BoxDecoration(
//               border: Border.all(color: Colors.lightBlue, width: 4),
//               borderRadius: BorderRadius.circular(12)),
//           child: Text('index: $index, height: $height'),
//         ));
//   }

//   Widget _wrapScrollTag({required int index, required Widget child}) =>
//       AutoScrollTag(
//         key: ValueKey(index),
//         controller: controller,
//         index: index,
//         highlightColor: Colors.black.withOpacity(0.1),
//         child: child,
//       );
// }
//////////////////////////////////////////////////
// import 'dart:developer';

// import 'package:flutter/material.dart';
// import 'package:geocoding/geocoding.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';

// void main() => runApp(const MyApp());

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: const MyHomePage(),
//       debugShowCheckedModeBanner: false,
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key});

//   @override
//   MyHomePageState createState() => MyHomePageState();
// }

// class MyHomePageState extends State<MyHomePage> {
//   GoogleMapController? controller;

//   final CameraPosition initialPosition =
//       const CameraPosition(target: LatLng(19.060617, 72.848791), zoom: 14);
//   var typemap = MapType.normal;
//   var cordinate1 = 'cordinate';
//   var lat = 19.060617;
//   var long = 72.848791;
//   var address = '';
//   late final Set<Marker> _markers = {};
//   Position? position;

//   Future<void> getAddress(latt, longg) async {
//     List<Placemark> placemark = await placemarkFromCoordinates(latt, longg);
//     debugPrint(
//         '-----------------------------------------------------------------------------------------');
//     //here you can see your all the relevent information based on latitude and logitude no.
//     debugPrint(placemark.toString());
//     debugPrint(
//         '-----------------------------------------------------------------------------------------');
//     Placemark place = placemark[0];
//     setState(() {
//       address =
//           '${place.street}, ${place.subLocality}, ${place.locality}, ${place.postalCode}, ${place.country}';
//     });
//   }

//   @override
//   void initState() {
//     super.initState();

//     determinePosition();
//   }

//   determinePosition() async {
//     LocationPermission permission;
//     permission = await Geolocator.checkPermission();
//     log(permission.toString());
//     if (permission == LocationPermission.always) {
//       position = await Geolocator.getCurrentPosition();
//       log("lat : ${position!.latitude}");
//       log("long : ${position!.longitude}");
//     }
//     if (permission == LocationPermission.denied) {
//       permission = await Geolocator.requestPermission();
//       if (permission == LocationPermission.deniedForever) {
//         return Future.error('Location Not Available');
//       }
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.blue[900],
//         title: const Text('Map App'),
//       ),
//       body: Stack(
//         children: [
//           GoogleMap(
//             mapType: MapType.normal,
//             myLocationButtonEnabled: true,
//             myLocationEnabled: true,
//             zoomGesturesEnabled: true,
//             zoomControlsEnabled: true,
//             scrollGesturesEnabled: true,
//             tiltGesturesEnabled: true,
//             rotateGesturesEnabled: true,
//             compassEnabled: true,
//             initialCameraPosition: initialPosition,
//             onMapCreated: (controller) {
//               setState(() {
//                 controller = controller;
//               });
//             },
//             onTap: (cordinate) {
//               setState(() {
//                 lat = cordinate.latitude;
//                 long = cordinate.longitude;
//                 getAddress(lat, long);

//                 cordinate1 = cordinate.toString();
//                 _markers.clear();
//                 _markers.add(Marker(
//                   markerId: const MarkerId('Location'),
//                   position: LatLng(lat, long),
//                 ));
//               });
//             },
//             onCameraMove: (CameraPosition position) {
//               if (_markers.isNotEmpty) {
//                 _markers.clear();
//                 _markers.add(Marker(
//                     markerId: const MarkerId('Location'),
//                     position: LatLng(
//                         position.target.latitude, position.target.longitude)));
//               }
//             },
//             markers: _markers,
//           ),
//           Positioned(
//             left: 5,
//             bottom: 150,
//             child: Text(
//               cordinate1,
//               softWrap: false,
//               style: const TextStyle(
//                 fontWeight: FontWeight.bold,
//                 fontSize: 15,
//               ),
//             ),
//           ),
//           Positioned(
//             left: 15,
//             bottom: 100,
//             child: SizedBox(
//               width: 200,
//               child: Text(
//                 address,
//                 softWrap: true,
//                 style: const TextStyle(
//                   fontWeight: FontWeight.bold,
//                   fontSize: 15,
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
