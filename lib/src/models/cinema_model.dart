class CinemaModel {
  int _page;
  int _total_results;
  int _total_pages;
  List<Cinema> _results = [];

  CinemaModel.fromJson(List<dynamic> parsedJson) {
//    _page = parsedJson['page'];
//    _total_results = parsedJson['total_results'];
//    _total_pages = parsedJson['total_pages'];
    List<Cinema> temp = [];
    for (int i = 0; i < parsedJson.length; i++) {
      Cinema result = Cinema.fromJson(parsedJson[i]);
      temp.add(result);
    }
    _results = temp;
  }

  List<Cinema> get results => _results;

  int get total_pages => _total_pages;

  int get total_results => _total_results;

  int get page => _page;
}

class Cinema {
  String name;
  String state;
  String street;
  String zipcode;
  String city;
  String country;
  String addressState;
  String phone;
  Coordinates coordinates;
  Operator operator;

  Cinema({
    this.name,
    this.state,
    this.street,
    this.zipcode,
    this.city,
    this.country,
    this.addressState,
    this.phone,
    this.coordinates,
    this.operator,
  });

  Cinema.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    state = json['state'];
    street = json['street'];
    zipcode = json['zipcode'];
    city = json['city'];
    country = json['country'];
    addressState = json['address_state'];
    phone = json['phone'];
    coordinates = Coordinates.fromJson(json['coordinates']);
    operator = Operator.fromJson(json['operator']);
  }
}

class Coordinates {
  double latitude;
  double longitude;

  Coordinates({
    this.latitude,
    this.longitude,
  });

  Coordinates.fromJson(Map<String, dynamic> json) {
    latitude = json['latitude'];
    longitude = json['longitude'];
  }
}

class Operator {
  String name;

  Operator({
    this.name,
  });

  Operator.fromJson(Map<String, dynamic> json) {
    name = json['name'];
  }
}
