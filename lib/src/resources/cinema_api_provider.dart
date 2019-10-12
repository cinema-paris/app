import 'dart:async';
import 'dart:convert';

import 'package:flutter_app/src/models/cinema_model.dart';
import 'package:flutter_app/src/models/ticket_model.dart';
import 'package:http/http.dart' show Client;

class CinemaApiProvider {
  Client client = Client();
  final _apiKey = 'your_api_key';

  Future<CinemaModel> fetchCinemaList() async {
    final response = await client.get("http://192.168.86.10:3000/cinemas").timeout(Duration(seconds: 5));
    print(response.body.toString());
    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON
      return CinemaModel.fromJson(json.decode(response.body));
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load post');
    }
  }
}
