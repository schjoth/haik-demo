import 'package:flutter/material.dart';
import 'package:haikapp/screens/home_screen.dart';
import 'package:haikapp/screens/my_pages_screen.dart';
import 'package:haikapp/screens/trips_screen.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key}) : super(key: key);
  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedIndex = 0;
  final routes = [
    HomeScreen.routeName,
    TripsScreen.routeName,
    MyPagesScreen.routeName
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    Navigator.pushReplacementNamed(context, routes[index]);
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.car_rental),
          label: 'Trips',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.people),
          label: 'My pages',
        ),
      ],
      currentIndex: _selectedIndex,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.white70,
      backgroundColor: Theme.of(context).primaryColor,
      onTap: _onItemTapped,
    );
  }
}
