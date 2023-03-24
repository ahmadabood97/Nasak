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
import '../../features/dashboard/screens/home/controllers/provider/home_provider.dart';
import '../../features/dashboard/screens/home/controllers/repo/home_repo.dart';
import '../../features/dashboard/screens/home/views/screens/shops/screens/shop_details/controllers/provider/shop_provider.dart';
import '../../features/dashboard/screens/home/views/screens/shops/screens/shop_details/controllers/repo/shop_repo.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //Repositories
  sl.registerLazySingleton(() => CountriesRepo(sharedPreferences: sl()));
  sl.registerLazySingleton(() => HomeRepo(sharedPreferences: sl()));
  sl.registerLazySingleton(() => LoginRepo(sharedPreferences: sl()));
  sl.registerLazySingleton(() => RegisterRepo(sharedPreferences: sl()));
  sl.registerLazySingleton(() => AddressRepo(sharedPreferences: sl()));
  sl.registerLazySingleton(() => ShopRepo(sharedPreferences: sl()));

  // Provider
  sl.registerFactory(() => CountriesProvider(countriesRepo: sl()));
  sl.registerFactory(() => HomeProvider(homeRepo: sl()));
  sl.registerFactory(() => LoginProvider(loginRepo: sl()));
  sl.registerFactory(() => AddressProvider(addressRepo: sl()));
  sl.registerFactory(() => ShopProvider(shopRepo: sl()));
  sl.registerFactory(() => RegisterProvider(
        registerRepo: sl(),
        countriesProvider: sl(),
      ));

  // External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
}
