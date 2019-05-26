class Movie {
  String title;
  String posterPath;

  Movie({this.title, this.posterPath});

  factory Movie.fromJson(Map<String, dynamic> json) {
    return new Movie(
        title: json['title'] as String,
        posterPath: json['poster_path'] as String);
  }
}
