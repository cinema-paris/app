class MovieModel {
  int _page;
  int _total_results;
  int _total_pages;
  List<Movie> _results = [];

  MovieModel.fromJson(List< dynamic> parsedJson) {
//    _page = parsedJson['page'];
//    _total_results = parsedJson['total_results'];
//    _total_pages = parsedJson['total_pages'];
    List<Movie> temp = [];
    for (int i = 0; i < parsedJson.length; i++) {
      Movie result = Movie.fromJson(parsedJson[i]);
      temp.add(result);
    }
    _results = temp;
  }

  List<Movie> get results => _results;

  int get total_pages => _total_pages;

  int get total_results => _total_results;

  int get page => _page;
}

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
    overview = json['overview'];
    backdropUrl = json['backdrop_url'];
    originalLanguage = json['original_language'];
    originalTitle = json['original_title'];
    releaseDate = json['release_date'];
    posterUrl = json['poster_url'];
    title = json['title'];
  }
}
