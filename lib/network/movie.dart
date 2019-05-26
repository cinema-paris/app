import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_app/entity_factory.dart';
import 'package:flutter_app/page/movies/source_movie_entity.dart';
import 'package:http/http.dart' as http;

Future<List<SourceMovieData>> fetchMovies() async {
  final response = await http.get('http://192.168.86.10:3000/movies');
  // Use the compute function to run parsePhotos in a separate isolate
  return compute(parseData, response.body);
}

// A function that will convert a response body into a List<Country>
List<SourceMovieData> parseData(String responseBody) {
  final parsed = json.decode(responseBody);
  final obj = EntityFactory.generateOBJ<SourceMovieEntity>(parsed);

  return obj.data;
}
