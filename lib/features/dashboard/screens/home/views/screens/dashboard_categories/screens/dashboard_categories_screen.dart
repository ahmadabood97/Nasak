import 'package:flutter/material.dart';
import 'package:nasak/features/dashboard/screens/home/views/screens/dashboard_shops/screens/shops/widgets/services_section.dart';
import '../../offers/views/screens/offers_screen.dart';
import '../../orders/screens/orders_screen.dart';
import '../widgets/bottom_bar_container_categories.dart';
import 'categories/views/screens/categories_screen.dart';

class DashboardCategoriesScreen extends StatefulWidget {
  final ParamsServiceSection params;

  const DashboardCategoriesScreen({Key? key, required this.params})
      : super(key: key);
  @override
  State<DashboardCategoriesScreen> createState() =>
      DashboardCategoriesScreenState();
}

class DashboardCategoriesScreenState extends State<DashboardCategoriesScreen> {
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
          CategoriesScreen(params: widget.params),
          OffersScreen(params: widget.params),
          OrdersScreen(params: widget.params),
        ],
      ),
      bottomNavigationBar: BottomBarContainerCategories(
        selectedIndex: selectedIndex,
        pageController: pageController,
      ),
    );
  }
}
