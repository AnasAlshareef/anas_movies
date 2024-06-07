import 'package:flutter/material.dart';
import '../../pages/favoritescreen/favoritescreen.dart';
import '../../pages/home_screen/homescreen.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    const HomeScreen(),
    const FavoriteScreen(),
  ];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromRGBO(5, 1, 74, 1),
        body: _children[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          elevation: 0,
          iconSize: 25,
          unselectedFontSize: 10,
          unselectedItemColor: Colors.white,
          showSelectedLabels: true,
          selectedFontSize: 15,
          selectedItemColor: Colors.white,
          backgroundColor: const Color.fromRGBO(5, 1, 74, 1),
          onTap: onTabTapped,
          currentIndex: _currentIndex,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: 'Favorites',
            ),
          ],
        ),
      ),
    );
  }
}
