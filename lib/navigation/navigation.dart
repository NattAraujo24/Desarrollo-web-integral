import 'package:flutter/material.dart';
import 'package:learning_b/navigation/home.dart';
import 'package:learning_b/navigation/profile.dart';
import 'package:learning_b/navigation/reservations.dart';
import 'package:learning_b/navigation/top.dart';


class Navigation extends StatefulWidget {
  const Navigation({super.key});

  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    home(),
    Top(),
    Reservations(),
    Profile(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Top',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.room_service),
            label: 'Reservations',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        unselectedItemColor: Colors.blueGrey,
        showUnselectedLabels: true,
        onTap: _onItemTapped,
        
      ),
    );
  }
}