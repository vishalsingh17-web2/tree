import 'package:flutter/material.dart';

Widget getBottomNavBar({required int index, required Function(int) onTap}) {
  return BottomNavigationBar(
    items: const <BottomNavigationBarItem>[
      BottomNavigationBarItem(
          icon: Icon(Icons.home), label: 'Home', backgroundColor: Colors.green),
      BottomNavigationBarItem(
          icon: Icon(Icons.search),
          label: 'Search',
          backgroundColor: Colors.yellow),
      BottomNavigationBarItem(
        icon: Icon(Icons.person),
        label: 'Profile',
        backgroundColor: Colors.blue,
      ),
    ],
    type: BottomNavigationBarType.shifting,
    currentIndex: index,
    selectedItemColor: Colors.black,
    iconSize: 20,
    onTap: onTap,
    elevation: 5,
  );
}
