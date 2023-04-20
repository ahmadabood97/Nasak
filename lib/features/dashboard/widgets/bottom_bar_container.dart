import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../core/utils/hex_colors.dart';
import '../../../core/widgets/show_dialog.dart';
import '../../auth/screens/login/controllers/provider/login_provider.dart';

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
      backgroundColor: HexColor('f8b6a8'),
      selectedItemColor: Colors.black,
      unselectedItemColor: Colors.black,
      unselectedLabelStyle: const TextStyle(color: Colors.grey),
      currentIndex: widget.selectedIndex,
      onTap: (index) async {
        if (index == 1) {
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
      items: [
        BottomNavigationBarItem(
          backgroundColor: HexColor('f8b6a8'),
          label: '',
          activeIcon: Icon(
            Icons.home,
            color: HexColor('193449'),
          ),
          icon: Icon(
            Icons.home_outlined,
            color: HexColor('857d92'),
          ),
        ),
        BottomNavigationBarItem(
          backgroundColor: HexColor('f8b6a8'),
          label: '',
          activeIcon: Icon(
            Icons.favorite,
            color: HexColor('193449'),
          ),
          icon: Icon(
            Icons.favorite_outline,
            color: HexColor('857d92'),
          ),
        ),
        BottomNavigationBarItem(
          backgroundColor: HexColor('f8b6a8'),
          label: '',
          activeIcon: Icon(
            Icons.settings,
            color: HexColor('193449'),
          ),
          icon: Icon(
            Icons.settings_outlined,
            color: HexColor('857d92'),
          ),
        ),
      ],
    );
  }
}
