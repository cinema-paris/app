import 'package:flutter_app/src/models/cinema_model.dart';
import 'package:rxdart/rxdart.dart';

import '../resources/repository.dart';

class CinemasBloc {
  final _repository = Repository();
  final _cinemasFetcher = PublishSubject<CinemaModel>();

  Observable<CinemaModel> get allCinema => _cinemasFetcher.stream;

  fetchAllMovies() async {
    CinemaModel itemModel = await _repository.fetchAllCinemas();
    _cinemasFetcher.sink.add(itemModel);
  }

  dispose() {
    _cinemasFetcher.close();
  }
}

final bloc = CinemasBloc();
