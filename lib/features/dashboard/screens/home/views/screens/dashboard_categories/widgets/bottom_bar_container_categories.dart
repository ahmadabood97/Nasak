import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../../../../core/widgets/show_dialog.dart';
import '../../../../../../../auth/screens/login/controllers/provider/login_provider.dart';

class BottomBarContainerCategories extends StatefulWidget {
  const BottomBarContainerCategories({
    Key? key,
    required this.selectedIndex,
    required PageController pageController,
  })  : _pageController = pageController,
        super(key: key);

  final int selectedIndex;
  final PageController _pageController;

  @override
  State<BottomBarContainerCategories> createState() =>
      _BottomBarContainerCategoriesState();
}

class _BottomBarContainerCategoriesState
    extends State<BottomBarContainerCategories> {
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
        if (index == 2 || index == 3) {
          if (Provider.of<LoginProvider>(context, listen: false).loginData !=
              null) {
            widget._pageController.jumpToPage(index);
          } else {
            showCustomDialog(context, 'Please Login...');
          }
        } else {
          widget._pageController.jumpToPage(index);
        }
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
