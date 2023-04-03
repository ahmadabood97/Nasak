import 'package:flutter/material.dart';
import '../../features/auth/screens/login/views/screens/signin_screen.dart';
import '../../features/auth/screens/register/views/screens/signup_screen.dart';
import '../../features/dashboard/screens/addresses/views/screens/add_address/screens/add_address_screen.dart';
import '../../features/dashboard/screens/addresses/views/screens/address_screen.dart';
import '../../features/dashboard/screens/countries/views/screens/countries_screen.dart';
import '../../features/dashboard/screens/dashboard_screen.dart';
import '../../features/dashboard/screens/favorites/views/screens/favorites_screen.dart';
import '../../features/dashboard/screens/home/models/app_services_model.dart';
import '../../features/dashboard/screens/home/views/screens/dashboard_categories/screens/categories/views/screens/categories_screen.dart';
import '../../features/dashboard/screens/home/views/screens/dashboard_categories/screens/categories/views/screens/category_products/views/screens/category_product_screen.dart';

import '../../features/dashboard/screens/home/views/screens/dashboard_categories/screens/dashboard_categories_screen.dart';
import '../../features/dashboard/screens/home/views/screens/dashboard_shops/screens/dashboard_shops_screen.dart';
import '../../features/dashboard/screens/home/views/screens/dashboard_shops/screens/shops/screens/filter/screens/filter_screen.dart';
import '../../features/dashboard/screens/home/views/screens/dashboard_shops/screens/shops/screens/search/screens/search_screen.dart';
import '../../features/dashboard/screens/home/views/screens/dashboard_shops/screens/shops/screens/shop_details/views/screens/about/screens/about_screen.dart';
import '../../features/dashboard/screens/home/views/screens/dashboard_shops/screens/shops/screens/shop_details/views/screens/basket/screens/basket_screen.dart';
import '../../features/dashboard/screens/home/views/screens/dashboard_shops/screens/shops/screens/shop_details/views/screens/checkout/screens/add_voucher_screen.dart';
import '../../features/dashboard/screens/home/views/screens/dashboard_shops/screens/shops/screens/shop_details/views/screens/checkout/screens/checkout_screen.dart';
import '../../features/dashboard/screens/home/views/screens/dashboard_shops/screens/shops/screens/shop_details/views/screens/shop_details_screen.dart';
import '../../features/dashboard/screens/home/views/screens/dashboard_shops/screens/shops/screens/shops_screen.dart';
import '../../features/dashboard/screens/home/views/screens/dashboard_shops/screens/shops/widgets/services_section.dart';
import '../../features/dashboard/screens/home/views/screens/home_screen.dart';
import '../../features/dashboard/screens/home/views/screens/offers/views/screens/offers_screen.dart';
import '../../features/dashboard/screens/home/views/screens/orders/screens/order_details/screens/order_details_screen.dart';
import '../../features/dashboard/screens/home/views/screens/orders/screens/orders_screen.dart';
import '../../features/dashboard/screens/inbox/inbox_screen.dart';

class Routes {
  static const String initialRoute = '/';
  static const String signinRoute = '/signin';
  static const String signupRoute = '/signup';
  static const String dashboardRoute = '/dashboard';
  static const String inboxRoute = '/inbox';
  static const String ordersRoute = '/order';
  static const String ordersDetailsRoute = '/ordersDetails';
  static const String favoriteRoute = '/favorite';
  static const String shopDetailsRoute = '/shopDetails';
  static const String basketRoute = '/basket';
  static const String checkoutRoute = '/checkout';
  static const String aboutRoute = '/about';
  static const String addressesRoute = '/addresses';
  static const String addAddressRoute = '/addAddress';
  static const String filterRoute = '/filter';
  static const String searchRoute = '/search';
  static const String offersRoute = '/offers';
  static const String addVoucherRoute = '/addVoucher';
  static const String homeRoute = '/home';
  static const String shopRoute = '/shop';
  static const String categoriesRoute = '/categories';
  static const String countriesRoute = '/countries';
  static const String citiesRoute = '/cities';
  static const String regionsRoute = '/regions';
  static const String categoryProductRoute = '/categoryProduct';
  static const String dashboardShopRoute = '/dashboardShop';
  static const String dashboardCategoryRoute = '/dashboardCategory';
}

class AppRoutes {
  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.checkoutRoute:
        return MaterialPageRoute(
          builder: (context) => const CheckoutScreen(),
        );
      case Routes.countriesRoute:
        return MaterialPageRoute(
          builder: (context) =>
              CountriesScreen(screen: settings.arguments as String),
        );
      case Routes.shopRoute:
        return MaterialPageRoute(
          builder: (context) =>
              ShopsScreen(params: settings.arguments as ParamsServiceSection),
        );
      case Routes.dashboardShopRoute:
        return MaterialPageRoute(
          builder: (context) => DashboardShopScreen(
              params: settings.arguments as ParamsServiceSection),
        );
      case Routes.dashboardCategoryRoute:
        return MaterialPageRoute(
          builder: (context) => DashboardCategoriesScreen(
              params: settings.arguments as ParamsServiceSection),
        );
      case Routes.homeRoute:
        return MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        );
      case Routes.addVoucherRoute:
        return MaterialPageRoute(
          builder: (context) => const AddVoucherScreen(),
        );
      case Routes.offersRoute:
        return MaterialPageRoute(
          builder: (context) =>
              OffersScreen(params: settings.arguments as ParamsServiceSection),
        );
      case Routes.searchRoute:
        return MaterialPageRoute(
          builder: (context) => const SearchScreen(),
        );
      case Routes.filterRoute:
        return MaterialPageRoute(
          builder: (context) => const FilterScreen(),
        );
      case Routes.addressesRoute:
        return MaterialPageRoute(
          builder: (context) => const AddressScreen(),
        );
      case Routes.addAddressRoute:
        return MaterialPageRoute(
          builder: (context) => const AddAddressScreen(),
        );
      case Routes.signinRoute:
        return MaterialPageRoute(
          builder: (context) =>
              SigninScreen(screenFrom: settings.arguments as String),
        );
      case Routes.ordersDetailsRoute:
        return MaterialPageRoute(
          builder: (context) => const OrderDetailsScreen(),
        );
      case Routes.aboutRoute:
        return MaterialPageRoute(
          builder: (context) => const AboutScreen(),
        );
      case Routes.signupRoute:
        return MaterialPageRoute(
          builder: (context) =>
              SignUpScreen(screenFrom: settings.arguments as String),
        );
      case Routes.dashboardRoute:
        return MaterialPageRoute(
          builder: (context) => const DashboardScreen(),
        );
      case Routes.inboxRoute:
        return MaterialPageRoute(
          builder: (context) => const InboxScreen(),
        );
      case Routes.ordersRoute:
        return MaterialPageRoute(
          builder: (context) =>
              OrdersScreen(params: settings.arguments as ParamsServiceSection),
        );
      case Routes.favoriteRoute:
        return MaterialPageRoute(
          builder: (context) =>
              FavoritesScreen(fromScreen: settings.arguments as String),
        );
      case Routes.shopDetailsRoute:
        return MaterialPageRoute(
          builder: (context) => ShopDetailsScreen(
              serviceProviders: settings.arguments as ServiceProviders),
        );
      case Routes.basketRoute:
        return MaterialPageRoute(
          builder: (context) => const BasketScreen(),
        );
      case Routes.categoriesRoute:
        return MaterialPageRoute(
          builder: (context) => CategoriesScreen(
              params: settings.arguments as ParamsServiceSection),
        );
      case Routes.categoryProductRoute:
        return MaterialPageRoute(
          builder: (context) => CategoryProductScreen(
              params: settings.arguments as ParamsCategoryProduct),
        );

      default:
        return undefinedRoute();
    }
  }

  static Route<dynamic> undefinedRoute() {
    return MaterialPageRoute(
      builder: (context) => const Scaffold(
        body: Center(
          child: Text("There is not screen"),
        ),
      ),
    );
  }
}
