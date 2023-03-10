import 'package:flutter/material.dart';
import '../../../core/utils/constants.dart';
import 'countries/controllers/provider/countries_provider.dart';
import 'home/controllers/provider/home_provider.dart';
import 'home/views/screens/home_screen.dart';
import 'home/views/screens/shops/widgets/drawer.dart';
import 'offers/screens/offers_screen.dart';
import 'package:provider/provider.dart';
import '../widgets/bottom_bar_container.dart';
import 'favourites/screens/favourites_screen.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);
  @override
  State<DashboardScreen> createState() => DashboardScreenState();
}

class DashboardScreenState extends State<DashboardScreen> {
  int selectedIndex = 0;
  static final PageController pageController = PageController(initialPage: 0);

  @override
  void initState() {
    super.initState();
    Provider.of<CountriesProvider>(context, listen: false).getCountries();
    Provider.of<HomeProvider>(context, listen: false).getHome();
  }

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
          OffersScreen(),
          FavoritesScreen(fromScreen: "Dashboard"),
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
