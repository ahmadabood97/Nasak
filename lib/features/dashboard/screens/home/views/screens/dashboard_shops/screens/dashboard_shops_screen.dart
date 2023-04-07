import 'package:flutter/material.dart';
import 'package:nasak/features/dashboard/screens/home/views/screens/dashboard_shops/screens/shops/screens/shops_screen.dart';
import 'package:nasak/features/dashboard/screens/home/views/screens/dashboard_shops/screens/shops/widgets/services_section.dart';
import '../../../../../favorites/views/screens/favorites_screen.dart';
import '../../offers/views/screens/offers_screen.dart';
import '../../orders/views/screens/orders_screen.dart';
import '../widgets/bottom_bar_container_shops.dart';

class DashboardShopScreen extends StatefulWidget {
  final ParamsServiceSection params;

  const DashboardShopScreen({Key? key, required this.params}) : super(key: key);
  @override
  State<DashboardShopScreen> createState() => DashboardShopScreenState();
}

class DashboardShopScreenState extends State<DashboardShopScreen> {
  int selectedIndex = 0;
  static final PageController pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: pageController,
        onPageChanged: (index) => setState(() {
          selectedIndex = index;
        }),
        children: [
          ShopsScreen(params: widget.params),
          OffersScreen(params: widget.params),
          FavoritesScreen(serviceId: widget.params.serviceId!),
          OrdersScreen(serviceId: widget.params.serviceId),
        ],
      ),
      bottomNavigationBar: BottomBarContainerShops(
        selectedIndex: selectedIndex,
        pageController: pageController,
      ),
    );
  }
}
