import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/src/ui/movies/MoviesDetailPage.dart';

import '../../blocs/movies_bloc.dart';
import '../../models/movie_model.dart';

class MoviesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    bloc.fetchAllMovies();
    return Scaffold(
      backgroundColor: Color.fromARGB(0, 0, 0, 0),
      appBar: AppBar(
        title: Text("Movies"),
      ),
      body: StreamBuilder(
        stream: bloc.allMovies,
        builder: (context, AsyncSnapshot<MovieModel> snapshot) {
          if (snapshot.hasError) {
            print(snapshot.error);
            return Text(snapshot.error.toString());
          }

          return snapshot.hasData
              ? new MoviesGridView(movies: snapshot.data.results)
              : new Center(child: new CircularProgressIndicator());
        },
      ),
    );
  }
}

class MoviesGridView extends StatelessWidget {
  final List<Movie> movies;

  const MoviesGridView({
    @required this.movies,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.all(4),
      itemCount: movies.length,
      gridDelegate: new SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 250,
          childAspectRatio: 2 / 3,
          crossAxisSpacing: 2,
          mainAxisSpacing: 2),
      itemBuilder: (context, position) {
        return buildListItem(context, movies[position]);
      },
    );
  }
}

Widget buildListItem(BuildContext context, Movie item) {
  return Card(
      elevation: 0,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Stack(children: <Widget>[
        Positioned.fill(
            child: (item.posterUrl != null)
                ? FittedBox(
                    fit: BoxFit.cover, child: Image.network(item.posterUrl))
                : Center(
                    child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Text(item.title, textAlign: TextAlign.center),
                  ))),
        Positioned.fill(
            child: new Material(
                color: Colors.transparent,
                child: new InkWell(
                  onTap: () => Navigator.pushNamed(
                    context,
                    MoviesDetailPage.routeName,
                    arguments: item,
                  ),
                )))
      ]));
}
