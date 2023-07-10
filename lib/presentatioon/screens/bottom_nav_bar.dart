import 'package:flutter/material.dart';
import 'package:glitzup/core/colors.dart';
import 'package:glitzup/core/constants.dart';

class BottomNavBar extends StatefulWidget {
  BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          // fixedColor: kWhiteColor,
          unselectedItemColor: kGreyColor,
          selectedItemColor: Colors.red,
          currentIndex: _currentIndex,
          onTap: (value) {
            setState(() {
              _currentIndex = value;
            });
          },
          items: const [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                ),
                label: '\u2022'),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: '\u2022'),
            BottomNavigationBarItem(
                icon: Icon(Icons.add_box_outlined), label: '\u2022'),
            BottomNavigationBarItem(
                icon: Icon(Icons.notifications_none), label: '\u2022'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: '\u2022')
          ]),
      body: SafeArea(child: screens[_currentIndex]),
    );
  }
}
