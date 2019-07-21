import 'package:flutter/material.dart';

import 'ui/cinemas/CinemasPage.dart';
import 'ui/movies/MoviesPage.dart';
import 'ui/tickets/TicketsPage.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Code Sample for Navigator',
      // MaterialApp contains our top-level Navigator
      initialRoute: '/cinemas',
      routes: {
        '/': (BuildContext context) => CinemasPage(),
        '/cinemas': (BuildContext context) => CinemasPage(),
        '/movies': (BuildContext context) => MoviesPage(),
        '/tickets': (BuildContext context) => TicketsPage(),
      },
      theme: ThemeData(
        brightness: Brightness.dark,
        accentColor: Colors.deepPurple,
      ),
    );
  }
}
