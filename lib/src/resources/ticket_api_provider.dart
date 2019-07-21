import 'dart:async';
import 'dart:convert';

import 'package:flutter_app/src/models/ticket_model.dart';
import 'package:http/http.dart' show Client;

class TicketApiProvider {
  Client client = Client();
  final _apiKey = 'your_api_key';

  Future<TicketModel> fetchTicketList() async {
    print("entered");
    final response = await client.get("http://www.mocky.io/v2/5ce9c31a3300004f3d525df4");
    print(response.body.toString());
    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON
      return TicketModel.fromJson(json.decode(response.body));
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load post');
    }
  }
}
