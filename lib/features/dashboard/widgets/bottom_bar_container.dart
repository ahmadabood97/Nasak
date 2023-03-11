import 'package:flutter/material.dart';

class BottomBarContainer extends StatefulWidget {
  const BottomBarContainer({
    Key? key,
    required this.selectedIndex,
    required PageController pageController,
  })  : _pageController = pageController,
        super(key: key);

  final int selectedIndex;
  final PageController _pageController;

  @override
  State<BottomBarContainer> createState() => _BottomBarContainerState();
}

class _BottomBarContainerState extends State<BottomBarContainer> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      showSelectedLabels: false,
      showUnselectedLabels: false,
      elevation: 0,
      backgroundColor: Colors.white,
      selectedItemColor: Colors.black,
      unselectedItemColor: Colors.black,
      unselectedLabelStyle: const TextStyle(color: Colors.grey),
      currentIndex: widget.selectedIndex,
      onTap: (index) {
        widget._pageController.jumpToPage(index);
      },
      items: const [
        BottomNavigationBarItem(
          backgroundColor: Color.fromARGB(255, 255, 243, 228),
          label: '',
          activeIcon: Icon(
            Icons.home,
            color: Colors.orange,
          ),
          icon: Icon(
            Icons.home_outlined,
            color: Color.fromARGB(255, 24, 15, 77),
          ),
        ),
        BottomNavigationBarItem(
          backgroundColor: Color.fromARGB(255, 255, 243, 228),
          label: '',
          activeIcon: Icon(
            Icons.local_offer,
            color: Colors.orange,
          ),
          icon: Icon(
            Icons.local_offer_outlined,
            color: Color.fromARGB(255, 24, 15, 77),
          ),
        ),
        BottomNavigationBarItem(
          backgroundColor: Color.fromARGB(255, 255, 243, 228),
          label: '',
          activeIcon: Icon(
            Icons.favorite,
            color: Colors.orange,
          ),
          icon: Icon(
            Icons.favorite_outline,
            color: Color.fromARGB(255, 24, 15, 77),
          ),
        ),
        BottomNavigationBarItem(
          backgroundColor: Color.fromARGB(255, 255, 243, 228),
          label: '',
          activeIcon: Icon(
            Icons.settings,
            color: Colors.orange,
          ),
          icon: Icon(
            Icons.settings_outlined,
            color: Color.fromARGB(255, 24, 15, 77),
          ),
        ),
      ],
    );
  }
}
