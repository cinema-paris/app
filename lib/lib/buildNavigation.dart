import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

List<BottomNavigationBarItem> getNavigationItems() {
  return const <BottomNavigationBarItem>[
    BottomNavigationBarItem(
        icon: Icon(Icons.place), title: const Text("Cinemas")),
    BottomNavigationBarItem(
        icon: Icon(Icons.movie), title: const Text("Movies")),
    BottomNavigationBarItem(
        icon: Icon(Icons.local_activity), title: const Text("Tickts")),
    BottomNavigationBarItem(
        icon: Icon(Icons.person), title: const Text("Account"))
  ];
}

BottomNavigationBar buildBottomNavigationBar(
    BuildContext context, int position, onItemTapped) {
  if (MediaQuery.of(context).size.width > 1000) {
    return null;
  }
  return BottomNavigationBar(
    items: getNavigationItems(),
    selectedItemColor: Colors.amber[800],
    showUnselectedLabels: true,
    type: BottomNavigationBarType.fixed,
    backgroundColor: Theme.of(context).dialogBackgroundColor,
    currentIndex: position,
    onTap: onItemTapped,
  );
}

Widget buildNavigationDrawer(BuildContext context, int position, onItemTapped) {
  if (MediaQuery.of(context).size.width < 1000) {
    return Container();
  }

  var content = getNavigationItems();
  return Drawer(
    child: ListView.builder(
      itemCount: content.length + 1,
      itemBuilder: (context, index) {
        if (index == 0) {
          // return the header
          return const UserAccountsDrawerHeader(
              accountName: Text('User'),
              accountEmail: Text('user@email.com'),
              currentAccountPicture: CircleAvatar(
                child: Icon(Icons.android),
              ));
        }
        index -= 1;

        return ListTile(
          leading: content[index].icon,
          title: content[index].title,
          selected: position == index,
          onTap: () {
            onItemTapped(index);
          },
        );
      },
    ),
  );
}
