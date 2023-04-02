import 'package:flutter/material.dart';

class BottomBarContainerShops extends StatefulWidget {
  const BottomBarContainerShops({
    Key? key,
    required this.selectedIndex,
    required PageController pageController,
  })  : _pageController = pageController,
        super(key: key);

  final int selectedIndex;
  final PageController _pageController;

  @override
  State<BottomBarContainerShops> createState() =>
      _BottomBarContainerShopsState();
}

class _BottomBarContainerShopsState extends State<BottomBarContainerShops> {
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
      onTap: (index) async {
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
            Icons.playlist_add_check_circle_rounded,
            color: Colors.orange,
          ),
          icon: Icon(
            Icons.playlist_add_check_circle_outlined,
            color: Color.fromARGB(255, 24, 15, 77),
          ),
        ),
      ],
    );
  }
}
