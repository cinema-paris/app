import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

BottomNavigationBar buildBottomNavigationBar(BuildContext context, int position, onItemTapped) {
  return BottomNavigationBar(
    items: <BottomNavigationBarItem>[
      BottomNavigationBarItem(icon: Icon(Icons.place), title: Text("Cinemas")),
      BottomNavigationBarItem(icon: Icon(Icons.movie), title: Text("Movies")),
      BottomNavigationBarItem(icon: Icon(Icons.local_activity), title: Text("Tickts")),
      BottomNavigationBarItem(icon: Icon(Icons.person), title: Text("Account"))
    ],
    selectedItemColor: Colors.amber[800],
    showUnselectedLabels: true,
    type: BottomNavigationBarType.fixed,
    backgroundColor: Theme.of(context).dialogBackgroundColor,
    currentIndex: position,
    onTap: onItemTapped,
  );
}
