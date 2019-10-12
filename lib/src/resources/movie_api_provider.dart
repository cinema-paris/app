import 'dart:async';
import 'dart:convert';

import 'package:flutter_app/src/models/movie_model.dart';
import 'package:http/http.dart' show Client;

class MovieApiProvider {
  Client client = Client();
  final _apiKey = 'your_api_key';

  Future<MovieModel> fetchMovieList() async {
    final response = await client.get("http://192.168.86.10:3000/movies").timeout(Duration(seconds: 5));
    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON
      return MovieModel.fromJson(json.decode(response.body));
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load post');
    }
  }
}
