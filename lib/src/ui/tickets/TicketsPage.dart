import 'dart:ui' as prefix0;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../blocs/tickets_bloc.dart';
import '../../models/ticket_model.dart';

class TicketsPage extends StatelessWidget {
  final GlobalKey<_ViewBackgroundState> myWidgetStateKey = new GlobalKey<_ViewBackgroundState>();

  @override
  Widget build(BuildContext context) {
    bloc.fetchAllTickets();

    return Stack(
      children: <Widget>[
        ViewBackground(key: myWidgetStateKey),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            title: Text("Tickets"),
            centerTitle: true,
          ),
          body: StreamBuilder(
            stream: bloc.allTickets,
            builder: (context, AsyncSnapshot<TicketModel> snapshot) {
              if (snapshot.hasError) {
                print(snapshot.error);
                return Text(snapshot.error.toString());
              }

              return snapshot.hasData
                  ? buildPageContent(context, snapshot.data.results)
                  : new Center(child: new CircularProgressIndicator());
            },
          ),
//          drawer: buildNavigationDrawer(),
        ),
      ],
    );
  }

  Widget buildPageContent(BuildContext context, List<Ticket> tickets) {
    return OrientationBuilder(builder: (context, orientation) {
      if (MediaQuery.of(context).size.width > 600) {
        return buildPageContentLarge(context, tickets);
      } else {
        return buildPageContentSmall(context, tickets);
      }
    });
  }

  Widget buildPageContentSmall(BuildContext context, List<Ticket> tickets) {
    return PageView.builder(
      onPageChanged: (index) {
        myWidgetStateKey.currentState.setTicket(tickets[index]);
      },
      itemCount: tickets.length,
      itemBuilder: (context, position) {
        return Container(
          padding: const EdgeInsets.all(64),
          child: buildListItemCard(context, tickets[position]),
        );
      },
    );
  }

  Widget buildPageContentLarge(BuildContext context, List<Ticket> tickets) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      scrollDirection: Axis.horizontal,
      itemCount: tickets.length,
      itemBuilder: (context, position) {
        return Center(
          child: Container(
            constraints: BoxConstraints(maxWidth: 400),
            padding: const EdgeInsets.all(24),
            child: buildListItemCard(context, tickets[position]),
          ),
        );
      },
    );
  }

  Widget buildListItemCard(BuildContext context, Ticket ticket) {
    return Card(
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
                )),
          )
        ]),
      ),
    );
  }

  Widget buildListItemContent(BuildContext context, Ticket ticket) {
    return Stack(
      children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            AspectRatio(
              aspectRatio: 16 / 9,
              child: (ticket?.posterPath != null) //TODO: use backdrop
                  ? FittedBox(
                      fit: BoxFit.cover,
                      child: Image.network(ticket.posterPath),
                    )
                  : Container(color: Theme.of(context).disabledColor),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(120, 8, 6, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    ticket.title,
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
            child: (ticket?.posterPath != null)
                ? Image.network(ticket.posterPath)
                : Container(color: Theme.of(context).backgroundColor, height: 132),
          ),
        )
      ],
    );
  }
}

class ViewBackground extends StatefulWidget {
  ViewBackground({Key key}) : super(key: key);

  @override
  _ViewBackgroundState createState() => _ViewBackgroundState();
}

class _ViewBackgroundState extends State<ViewBackground> {
  Ticket _ticket;

  void setTicket(Ticket ticket) {
    setState(() {
      _ticket = ticket;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      decoration: new BoxDecoration(
        image: new DecorationImage(
          image: new NetworkImage(_ticket?.posterPath ??
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
    );
  }
}
