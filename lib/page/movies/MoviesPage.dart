import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/lib/buildBottomNavigationBar.dart';
import 'package:flutter_app/network/movie.dart';
import 'package:flutter_app/page/movies/Movie.dart';

class MoviesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tickets"),
      ),
      body: new FutureBuilder<List<Movie>>(
        future: fetchMovies(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasError) print(snapshot.error);

          return snapshot.hasData
              ? new MoviesGridView(movies: snapshot.data)
              : new Center(child: new CircularProgressIndicator());
        },
      ),
      bottomNavigationBar: buildBottomNavigationBar(context, 1),
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
      semanticContainer: true,
      elevation: 0,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Stack(children: <Widget>[
        Positioned.fill(child: Image.network(item.posterPath)),
        Positioned.fill(
            child: new Material(
                color: Colors.transparent,
                child: new InkWell(
                  onTap: () => null,
                )))
      ]));
}