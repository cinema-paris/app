import 'package:flutter/material.dart';
import 'package:flutter_app/src/ui/HomePage.dart';

import 'ui/HomePage.dart';
import 'ui/cinemas/CinemasPage.dart';
import 'ui/movies/MoviesDetailPage.dart';
import 'ui/movies/MoviesPage.dart';
import 'ui/tickets/TicketsPage.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movies',
//       MaterialApp contains our top-level Navigator
      initialRoute: '/',
      routes: {
        '/': (BuildContext context) => HomePage(),
        '/cinemas': (BuildContext context) => CinemasPage(),
        '/movies': (BuildContext context) => MoviesPage(),
        '/tickets': (BuildContext context) => TicketsPage(),
        MoviesDetailPage.routeName: (context) => MoviesDetailPage(),
      },
      theme: ThemeData(
        brightness: Brightness.dark,
        accentColor: Colors.deepPurple,
      ),
    );
  }
}
