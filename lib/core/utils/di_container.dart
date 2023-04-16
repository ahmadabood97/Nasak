import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../features/auth/screens/login/controllers/provider/login_provider.dart';
import '../../features/auth/screens/login/controllers/repo/login_repo.dart';
import '../../features/auth/screens/register/controllers/provider/register_provider.dart';
import '../../features/auth/screens/register/controllers/repo/register_repo.dart';
import '../../features/dashboard/screens/addresses/controllers/provider/address_provider.dart';
import '../../features/dashboard/screens/addresses/controllers/repo/address_repo.dart';
import '../../features/dashboard/screens/countries/controllers/provider/countries_provider.dart';
import '../../features/dashboard/screens/countries/controllers/repo/countries_repo.dart';
import '../../features/dashboard/screens/favorites/controllers/provider/favorite_provider.dart';
import '../../features/dashboard/screens/favorites/controllers/repo/favorite_repo.dart';
import '../../features/dashboard/screens/home/controllers/provider/home_provider.dart';
import '../../features/dashboard/screens/home/controllers/repo/home_repo.dart';
import '../../features/dashboard/screens/home/views/screens/checkout/controllers/provider/checkout_provider.dart';
import '../../features/dashboard/screens/home/views/screens/checkout/controllers/repo/checkout_repo.dart';
import '../../features/dashboard/screens/home/views/screens/checkout/views/screens/delivery_date_time/controllers/provider/delivery_date_time_provider.dart';
import '../../features/dashboard/screens/home/views/screens/dashboard_categories/screens/categories/views/screens/category_products/controllers/provider/category_details_provider.dart';
import '../../features/dashboard/screens/home/views/screens/dashboard_categories/screens/categories/views/screens/category_products/controllers/repo/category_details_repo.dart';
import '../../features/dashboard/screens/home/views/screens/dashboard_shops/screens/shops/screens/shop_details/controllers/provider/shop_provider.dart';
import '../../features/dashboard/screens/home/views/screens/dashboard_shops/screens/shops/screens/shop_details/controllers/repo/shop_repo.dart';
import '../../features/dashboard/screens/home/views/screens/dashboard_shops/screens/shops/screens/shop_details/views/screens/about/controllers/provider/about_provider.dart';
import '../../features/dashboard/screens/home/views/screens/dashboard_shops/screens/shops/screens/shop_details/views/screens/about/controllers/repo/about_repo.dart';
import '../../features/dashboard/screens/home/views/screens/offers/controllers/provider/offer_provider.dart';
import '../../features/dashboard/screens/home/views/screens/offers/controllers/repo/offers_repo.dart';
import '../../features/dashboard/screens/home/views/screens/orders/controllers/provider/order_provider.dart';
import '../../features/dashboard/screens/home/views/screens/orders/controllers/repo/order_repo.dart';
import '../../features/dashboard/screens/home/views/screens/orders/views/screens/order_details/controllers/provider/order_details_provider.dart';
import '../../features/dashboard/screens/home/views/screens/orders/views/screens/order_details/controllers/repo/order_details_repo.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //Repositories
  sl.registerLazySingleton(() => CountriesRepo(sharedPreferences: sl()));
  sl.registerLazySingleton(() => HomeRepo(sharedPreferences: sl()));
  sl.registerLazySingleton(() => LoginRepo(sharedPreferences: sl()));
  sl.registerLazySingleton(() => RegisterRepo(sharedPreferences: sl()));
  sl.registerLazySingleton(() => AddressRepo(sharedPreferences: sl()));
  sl.registerLazySingleton(() => ShopRepo(sharedPreferences: sl()));
  sl.registerLazySingleton(() => CategoryDetailsRepo(sharedPreferences: sl()));
  sl.registerLazySingleton(() => FavoriteRepo(sharedPreferences: sl()));
  sl.registerLazySingleton(() => OffersRepo(sharedPreferences: sl()));
  sl.registerLazySingleton(() => AboutRepo(sharedPreferences: sl()));
  sl.registerLazySingleton(() => OrdersRepo(sharedPreferences: sl()));
  sl.registerLazySingleton(() => OrderDetailsRepo(sharedPreferences: sl()));
  sl.registerLazySingleton(() => CheckoutRepo(sharedPreferences: sl()));

  // Provider
  sl.registerFactory(() => CountriesProvider(countriesRepo: sl()));
  sl.registerFactory(() => HomeProvider(homeRepo: sl()));
  sl.registerFactory(() => LoginProvider(loginRepo: sl()));
  sl.registerFactory(() => AddressProvider(addressRepo: sl()));
  sl.registerFactory(() => ShopProvider(shopRepo: sl()));
  sl.registerFactory(() => CategoryDetailsProvider(categoryDetailsRepo: sl()));
  sl.registerFactory(() => FavoriteProvider(favoriteRepo: sl()));
  sl.registerFactory(() => OffersProvider(offerRepo: sl()));
  sl.registerFactory(() => AboutProvider(aboutRepo: sl()));
  sl.registerFactory(() => OrdersProvider(orderRepo: sl()));
  sl.registerFactory(() => OrderDetailsProvider(orderDetailsRepo: sl()));
  sl.registerFactory(() => CheckoutProvider(checkoutRepo: sl()));
  sl.registerFactory(() => DeliveryDateTimeProvider());
  sl.registerFactory(() => RegisterProvider(
        registerRepo: sl(),
        countriesProvider: sl(),
      ));

  // External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
}
