import 'package:flutter/material.dart';

import '../util/constants.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late PageController pageController;
  int _selectedIndex = 0;
  String? token;

//   TODO: Replace with actual screen as soon as we have one
  static final List<Widget> _widgetOptions = <Widget>[
    const Scaffold(
        body: Center(
      child: Icon(Icons.widgets_outlined),
    )),
    const Scaffold(
        body: Center(
      child: Icon(Icons.bookmark_outline),
    )),
    const Scaffold(
        body: Center(
      child: Icon(Icons.circle_notifications),
    )),
    const Scaffold(
        body: Center(
      child: Icon(Icons.account_circle),
    )),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onTap(int pageIndex) {
    pageController.animateToPage(
      pageIndex,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  void initState() {
    pageController = PageController();
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.widgets_outlined, size: 28),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark_border_outlined, size: 28),
            label: 'Bookmark',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.circle_notifications_rounded, size: 28),
            label: 'Notification',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle, size: 28),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.orange[300],
        onTap: _onTap,
        unselectedItemColor: kPrimaryColor,
      ),
      body: PageView(
        controller: pageController,
        onPageChanged: _onItemTapped,
        physics: const NeverScrollableScrollPhysics(),
        children: _widgetOptions,
      ),
    );
  }
}
