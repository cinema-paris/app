import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_app/page/movies/Movie.dart';
import 'package:flutter_app/page/tickets/Ticket.dart';
import 'package:http/http.dart' as http;

Future<List<Ticket>> fetchTicket() async {
  final response = await http.get('http://www.mocky.io/v2/5ce9c31a3300004f3d525df4');
  // Use the compute function to run parsePhotos in a separate isolate
  return compute(parseData, response.body);
}

// A function that will convert a response body into a List<Country>
List<Ticket> parseData(String responseBody) {
  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();

  List<Ticket> list = parsed.map<Ticket>((json) => new Ticket.fromJson(json)).toList();
  return list;
}
