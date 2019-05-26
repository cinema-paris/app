import 'dart:ui' as prefix0;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/lib/buildBottomNavigationBar.dart';
import 'package:flutter_app/network/movie.dart';
import 'package:flutter_app/page/movies/source_movie_entity.dart';

class TicketsPage extends StatefulWidget {
  TicketsPage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<TicketsPage> {
  int bottomSelectedIndex = 0;
  SourceMovieData selectedTicket;

  @override
  void initState() {
    super.initState();
  }

  void pageChanged(int index, SourceMovieData ticket) {
    setState(() {
      bottomSelectedIndex = index;
      selectedTicket = ticket;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        new Container(
          decoration: new BoxDecoration(
            image: new DecorationImage(
              image: new NetworkImage(selectedTicket?.attributes?.posterUrl ??
                  "https://image.tmdb.org/t/p/original/y4MBh0EjBlMuOzv9axM4qJlmhzz.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: new BackdropFilter(
            filter: new prefix0.ImageFilter.blur(sigmaX: 12.0, sigmaY: 12.0),
            child: new Container(
              decoration: new BoxDecoration(color: Colors.white.withOpacity(0.0)),
            ),
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            title: Text("Tickets"),
          ),
          body: FutureBuilder<List<SourceMovieData>>(
            future: fetchMovies(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasError) {
                print(snapshot.error);
                return Text(snapshot.error.toString());
              }

              return snapshot.hasData
                  ? buildPageContent(context, snapshot.data)
                  : new Center(child: new CircularProgressIndicator());
            },
          ),
          bottomNavigationBar: buildBottomNavigationBar(context, 2),
        ),
      ],
    );
  }

  Widget buildPageContent(BuildContext context, List<SourceMovieData> tickets) {
    return PageView.builder(
      onPageChanged: (index) {
        pageChanged(index, tickets[index]);
      },
      itemCount: tickets.length,
      itemBuilder: (context, position) {
        return buildListItem(context, tickets[position]);
      },
    );
  }

  Widget buildListItem(BuildContext context, SourceMovieData ticket) {
    return Padding(
      padding: const EdgeInsets.all(64),
      child: Card(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          margin: EdgeInsets.fromLTRB(0, 4, 0, 4),
          child: AspectRatio(
            aspectRatio: 0.618,
            child: Stack(children: <Widget>[
              buildListItemContent(context, ticket),
              Positioned.fill(
                  child: new Material(
                      color: Colors.transparent,
                      child: new InkWell(
                        onTap: () => null,
                      )))
            ]),
          )),
    );
  }

  Widget buildListItemContent(BuildContext context, SourceMovieData ticket) {
    return Stack(
      children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            AspectRatio(
              aspectRatio: 16 / 9,
              child: (ticket?.attributes?.backdropUrl != null)
                  ? FittedBox(
                      fit: BoxFit.cover,
                      child: Image.network(ticket.attributes.backdropUrl),
                    )
                  : Container(color: Theme.of(context).disabledColor),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(120, 8, 6, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    ticket.attributes.title,
                    style: Theme.of(context).textTheme.title,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Chip(
                    label: Text('VOST'),
                    backgroundColor: Theme.of(context).accentColor.withOpacity(0.5),
                    labelStyle: Theme.of(context).textTheme.caption,
                  ),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("Cinema Gaumont Opera"),
                  ],
                ),
              ),
            ),
            Padding(
                padding: const EdgeInsets.all(12),
                child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: <Widget>[
                  Column(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
                    Text("Aujourd'hui"),
                    Text("18:30", style: Theme.of(context).textTheme.body1.copyWith(fontSize: 32)),
                  ]),
                  Column(crossAxisAlignment: CrossAxisAlignment.end, children: <Widget>[
                    Text("Salle 01"),
                    Text("R5, R3", style: Theme.of(context).textTheme.body1.copyWith(fontSize: 32)),
                  ]),
                ])),
          ],
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(16, 120, 16, 0),
          child: Container(
            width: 88,
            child: (ticket?.attributes?.backdropUrl != null)
                ? Image.network(ticket.attributes.posterUrl)
                : Container(color: Theme.of(context).backgroundColor, height: 132),
          ),
        )
      ],
    );
  }
}
