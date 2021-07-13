import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:geolocator_platform_interface/src/models/position.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';

class Mapa extends StatefulWidget {

  Position posicionActual;


  Mapa(Position posicionActual) {
    this.posicionActual = posicionActual;
  }

  @override
  _MapaState createState() => _MapaState(posicionActual);
}

class _MapaState extends State<Mapa> {
  GoogleMapController mapController;
  Position posicionActual;
  double latitud;
  double longitud;
  _MapaState(Position posicionActual) {
    this.posicionActual = posicionActual;
    this.latitud = posicionActual.latitude;
    this.longitud = posicionActual.longitude;
  }

  LatLng _center = const LatLng(45.521563, -122.677433);



  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Ejemplo de Maps'),
          backgroundColor: Colors.green[700],
        ),
        body: GoogleMap(
          onMapCreated: _onMapCreated,
          initialCameraPosition: CameraPosition(
            target: _center,
            zoom: 11.0,
          ),
        ),
      ),
    );
  }
}