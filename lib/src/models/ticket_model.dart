class TicketModel {
  int _page;
  int _total_results;
  int _total_pages;
  List<Ticket> _results = [];

  TicketModel.fromJson(List<dynamic> parsedJson) {
//    _page = parsedJson['page'];
//    _total_results = parsedJson['total_results'];
//    _total_pages = parsedJson['total_pages'];
    List<Ticket> temp = [];
    for (int i = 0; i < parsedJson.length; i++) {
      Ticket result = Ticket.fromJson(parsedJson[i]);
      temp.add(result);
    }
    _results = temp;
  }

  List<Ticket> get results => _results;

  int get total_pages => _total_pages;

  int get total_results => _total_results;

  int get page => _page;
}

class Ticket {
  String posterPath;
  String title;

  Ticket({this.posterPath, this.title});

  Ticket.fromJson(Map<String, dynamic> json) {
    posterPath = json['poster_path'];
    title = json['title'];
  }
}
