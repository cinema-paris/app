import 'package:flutter_app/page/movies/source_movie_entity.dart';

class EntityFactory {
  static T generateOBJ<T>(json) {
    if (1 == 0) {
      return null;
    } else if (T.toString() == "SourceMovieEntity") {
      return SourceMovieEntity.fromJson(json) as T;
    } else {
      return null;
    }
  }
}