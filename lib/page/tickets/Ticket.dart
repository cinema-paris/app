class Ticket {
  String title;
  String posterPath;

  Ticket({this.title, this.posterPath});

  factory Ticket.fromJson(Map<String, dynamic> json) {
    return new Ticket(
        title: json['title'] as String,
        posterPath: json['poster_path'] as String);
  }
}
