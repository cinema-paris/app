class Movie {
  String id;
  String overview;
  String backdropUrl;
  String originalLanguage;
  String originalTitle;
  String releaseDate;
  String posterUrl;
  String title;

  Movie(
      {this.id,
        this.overview,
        this.backdropUrl,
        this.originalLanguage,
        this.originalTitle,
        this.releaseDate,
        this.posterUrl,
        this.title});

  Movie.fromJson(Map<String, dynamic> json) {
    overview = json['id'];

    final attrs = json['attributes'] as Map<String, dynamic>;
    overview = attrs['overview'];
    backdropUrl = attrs['backdrop_url'];
    originalLanguage = attrs['original_language'];
    originalTitle = attrs['original_title'];
    releaseDate = attrs['release_date'];
    posterUrl = attrs['poster_url'];
    title = attrs['title'];
  }
}
