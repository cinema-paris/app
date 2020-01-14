import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/src/blocs/cinemas_bloc.dart';
import 'package:flutter_app/src/models/cinema_model.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class CinemasPage extends StatefulWidget {
  @override
  State<CinemasPage> createState() => CinemasPageState();
}

class CinemasPageState extends State<CinemasPage> {
  Completer<GoogleMapController> _controller = Completer();
  final List<Marker> _markers = [];

  static final CameraPosition _kGoogleParis = CameraPosition(
    target: LatLng(48.8567, 2.3508),
    zoom: 14.4746,
  );

  static final CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  @override
  Widget build(BuildContext context) {
    bloc.fetchAllMovies();
    return new Scaffold(
      body: StreamBuilder(
        stream: bloc.allCinema,
        builder: (context, AsyncSnapshot<CinemaModel> snapshot) {
          if (snapshot.hasError) {
            print(snapshot.error);
            return Text(snapshot.error.toString());
          }

//          _loadMarkers(snapshot.data.results);

          if (snapshot.hasData) {
            _setMarkers(snapshot.data.results);
          }

          return Stack(
            children: <Widget>[
              buildMaps(context),
              if (!snapshot.hasData) new Center(child: new CircularProgressIndicator())
            ],
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _centerToMyLocation,
        child: Icon(Icons.my_location),
      ),
    );
  }

  Future<void> _centerToMyLocation() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_kGoogleParis));
  }

  Future<void> _setMarkers(List<Cinema> results) async {
    setState(() {
      _markers.clear();
      _markers.addAll(results
          .where((item) => item.coordinates.latitude != null && item.coordinates.latitude != null)
          .map(
            (item) => Marker(
              markerId: MarkerId(item.street),
              position: LatLng(item.coordinates.latitude, item.coordinates.longitude),
              infoWindow: InfoWindow(title: item.name, snippet: item.street),
            ),
          ));
    });
  }

  Widget buildMaps(BuildContext context) {
    return new GoogleMap(
      mapType: MapType.normal,
      mapToolbarEnabled: false,
      rotateGesturesEnabled: false,
      compassEnabled: false,
      initialCameraPosition: _kGoogleParis,
      onMapCreated: (GoogleMapController controller) {
        _controller.complete(controller);
      },
      markers: _markers.toSet(),
    );
  }
}
