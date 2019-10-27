import 'package:flutter/material.dart';
import 'package:flutter_app/lib/buildNavigation.dart';

import 'account/AccountPage.dart';
import 'cinemas/CinemasPage.dart';
import 'movies/MoviesPage.dart';
import 'tickets/TicketsPage.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  static List<Widget> _widgetOptions = <Widget>[
    CinemasPage(),
    MoviesPage(),
    TicketsPage(),
    AccountPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: <Widget>[
          buildNavigationDrawer(context, _selectedIndex, _onItemTapped),
          // Spacer(flex: 1),
          // _widgetOptions.elementAt(_selectedIndex),
          Expanded(child: _widgetOptions.elementAt(_selectedIndex)),
        ],
      ),
      bottomNavigationBar:
          buildBottomNavigationBar(context, _selectedIndex, _onItemTapped),
    );
  }
}
