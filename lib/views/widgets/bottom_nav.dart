import 'package:flutter/material.dart';
import '../../utill/constants/color_manager.dart';

class BottomNavBar extends StatelessWidget {
  final Function(int) onTap;

  const BottomNavBar({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      selectedFontSize: 10,
      unselectedFontSize: 8,
      showUnselectedLabels: true,
      elevation: 6,
      backgroundColor:  ColorsManager.buttonColr,
      selectedItemColor:  ColorsManager.vibrantAmber,
      unselectedItemColor:  ColorsManager.white,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home_outlined),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite_border),
          label: 'Favourite',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.shopping_cart_outlined),
          label: 'Cart',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings_outlined),
          label: 'Settings',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person_remove_outlined),
          label: 'Profile',
        ),
      ],
      onTap: onTap,
    );
  }
}
