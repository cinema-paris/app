import 'dart:async';

import 'package:flutter_app/src/models/cinema_model.dart';

import '../models/movie_model.dart';
import '../models/ticket_model.dart';
import 'cinema_api_provider.dart';
import 'movie_api_provider.dart';
import 'ticket_api_provider.dart';

class Repository {
  final moviesApiProvider = MovieApiProvider();
  final ticketsApiProvider = TicketApiProvider();
  final cinemasApiProvider = CinemaApiProvider();

  Future<MovieModel> fetchAllMovies() => moviesApiProvider.fetchMovieList();

  Future<TicketModel> fetchAllTickets() => ticketsApiProvider.fetchTicketList();

  Future<CinemaModel> fetchAllCinemas() => cinemasApiProvider.fetchCinemaList();
}
