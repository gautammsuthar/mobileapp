import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    Key? key,
    required this.currentIndex,
    required this.selectedItemColor,
    required this.onTap,
    required this.unselectedItemColor,
  }) : super(key: key);
  final int currentIndex;
  final Color selectedItemColor;
  final Function(int) onTap;
  final Color unselectedItemColor;

  @override
  BottomNavigationBar build(BuildContext context) {
    return BottomNavigationBar(
      onTap: onTap,
      currentIndex: currentIndex,
      selectedItemColor: selectedItemColor,
      unselectedItemColor: unselectedItemColor,
      showSelectedLabels: false,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(
            Icons.widgets_outlined,
            size: 35,
          ),
          label: 'Menu',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.bookmark_border_rounded,
            size: 35,
          ),
          label: 'Bookmark',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.circle_notifications,
            size: 35,
          ),
          label: 'Notification',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.account_circle_outlined,
            size: 35,
          ),
          label: 'Profile',
        ),
      ],
    );
  }
}
