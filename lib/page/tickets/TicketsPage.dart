import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/lib/buildBottomNavigationBar.dart';

class TicketsPage extends StatelessWidget {
  const TicketsPage({
    this.onSignupComplete,
  });

  final VoidCallback onSignupComplete;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tickets"),
      ),
      body: ListView.builder(
        padding: EdgeInsets.fromLTRB(8, 4, 8, 4),
        itemCount: 3,
        itemBuilder: (context, position) {
          return buildListItem(context, position);
        },
      ),
      bottomNavigationBar: buildBottomNavigationBar(context, 2),
    );
  }

  Widget buildListItem(BuildContext context, int position) {
    return Card(
      semanticContainer: true,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      margin: EdgeInsets.fromLTRB(0, 4, 0, 4),
      child: Stack(children: <Widget>[
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              width: 100.0,
              constraints: BoxConstraints(maxWidth: 150.0, minWidth: 100.0),
              child: Image.network(
                  "https://image.tmdb.org/t/p/original/y4MBh0EjBlMuOzv9axM4qJlmhzz.jpg"),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("Les Gardiens de la Galaxie",
                      style: Theme.of(context).textTheme.title),
                  Chip(
                    label: Text('VOST'),
                    backgroundColor:
                    Theme.of(context).accentColor.withOpacity(0.5),
                    labelStyle: Theme.of(context).textTheme.caption,
                  ),
                  Text("Cinema Gaumont Opera"),
                  Text("2 Boulevard des Capucines",
                      style: Theme.of(context).textTheme.caption),
                  Text("Salle 01 - Place R5, R3"),
                ],
              ),
            ),
          ],
        ),
        Positioned.fill(
            child: new Material(
                color: Colors.transparent,
                child: new InkWell(
                  onTap: () => null,
                )))
      ]),
    );
  }
}