import 'package:flutter/material.dart';
import '../../../core/utils/constants.dart';
import 'favorites/views/screens/favorites_screen.dart';
import 'home/views/screens/dashboard_shops/screens/shops/widgets/drawer.dart';
import 'home/views/screens/home_screen.dart';
import '../widgets/bottom_bar_container.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);
  @override
  State<DashboardScreen> createState() => DashboardScreenState();
}

class DashboardScreenState extends State<DashboardScreen> {
  int selectedIndex = 0;
  static final PageController pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
          width: Constants.getWidth(context) * 0.85,
          backgroundColor: const Color.fromARGB(255, 255, 243, 228),
          child: const MyDrawer()),
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: pageController,
        onPageChanged: (index) => setState(() {
          selectedIndex = index;
        }),
        children: const [
          HomeScreen(),
          FavoritesScreen(serviceId: ''),
          MyDrawer(),
        ],
      ),
      bottomNavigationBar: BottomBarContainer(
        selectedIndex: selectedIndex,
        pageController: pageController,
      ),
    );
  }
}
