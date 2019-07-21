import 'dart:async';

import '../models/movie_model.dart';
import '../models/ticket_model.dart';
import 'movie_api_provider.dart';
import 'ticket_api_provider.dart';

class Repository {
  final moviesApiProvider = MovieApiProvider();
  final ticketsApiProvider = TicketApiProvider();

  Future<MovieModel> fetchAllMovies() => moviesApiProvider.fetchMovieList();

  Future<TicketModel> fetchAllTickets() => ticketsApiProvider.fetchTicketList();
}
