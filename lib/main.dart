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
import 'features/dashboard/screens/home/views/screens/checkout/controllers/provider/checkout_provider.dart';
import 'features/dashboard/screens/home/views/screens/checkout/views/screens/delivery_date_time/controllers/provider/delivery_date_time_provider.dart';
import 'features/dashboard/screens/home/views/screens/dashboard_categories/screens/categories/views/screens/category_products/controllers/provider/category_details_provider.dart';
import 'features/dashboard/screens/home/views/screens/dashboard_shops/screens/shops/screens/shop_details/controllers/provider/shop_provider.dart';
import 'features/dashboard/screens/home/views/screens/dashboard_shops/screens/shops/screens/shop_details/views/screens/about/controllers/provider/about_provider.dart';
import 'features/dashboard/screens/home/views/screens/offers/controllers/provider/offer_provider.dart';
import 'features/dashboard/screens/home/views/screens/orders/controllers/provider/order_provider.dart';
import 'features/dashboard/screens/home/views/screens/orders/views/screens/order_details/controllers/provider/order_details_provider.dart';
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
        ChangeNotifierProvider(create: (context) => di.sl<ShopProvider>()),
        ChangeNotifierProvider(create: (context) => di.sl<OffersProvider>()),
        ChangeNotifierProvider(create: (context) => di.sl<FavoriteProvider>()),
        ChangeNotifierProvider(create: (context) => di.sl<AboutProvider>()),
        ChangeNotifierProvider(create: (context) => di.sl<OrdersProvider>()),
        ChangeNotifierProvider(create: (context) => di.sl<CheckoutProvider>()),
        ChangeNotifierProvider(
            create: (context) => di.sl<DeliveryDateTimeProvider>()),
        ChangeNotifierProvider(
            create: (context) => di.sl<OrderDetailsProvider>()),
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

  // DateTime time = DateTime.now(); // Here you can get your current local time
  //   time.add(Duration(minutes: 120));
  //   print(time);