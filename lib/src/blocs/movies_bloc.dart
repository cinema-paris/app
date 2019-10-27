import '../resources/repository.dart';
import 'package:rxdart/rxdart.dart';
import '../models/movie_model.dart';

class MoviesBloc {
  final _repository = Repository();

  final _moviesFetcher = PublishSubject<MovieModel>();
  Observable<MovieModel> get allMovies => _moviesFetcher.stream;

  fetchAllMovies() async {
    // old :
    // MovieModel itemModel = await _repository.fetchAllMovies();
    // _moviesFetcher.sink.add(itemModel);

    _repository
        .fetchAllMovies()
        .then((it) => {_moviesFetcher.sink.add(it)})
        .catchError((it) => {_moviesFetcher.sink.addError(it)});
  }

  dispose() {
    _moviesFetcher.close();
  }
}

final bloc = MoviesBloc();
