import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapsPage extends StatefulWidget {
  const GoogleMapsPage({Key? key}) : super(key: key);

  @override
  State<GoogleMapsPage> createState() => _GoogleMapsPageState();
}

class _GoogleMapsPageState extends State<GoogleMapsPage> {
  final CameraPosition _posicionInicial = const CameraPosition(
      target: LatLng(-16.504314, -68.131061), zoom: 17.0);
  Completer<GoogleMapController> _controller = Completer();
  MapType _mapType = MapType.normal;
  final Set<Marker> _markers = {};
  Position? _currentPosition;
  String _currentAddress = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Google Maps'),
      ),
      body: Stack(
        children: [
          GoogleMap(
            initialCameraPosition: _posicionInicial,
            onMapCreated: _onMapCreated,
            mapType: _mapType,
            markers: _markers,
          ),
          Container(
            margin: const EdgeInsets.only(top: 80, right: 10),
            alignment: Alignment.topRight,
            child: Column(
                children: [
                  FloatingActionButton(
                      child: const Icon(Icons.layers),
                      elevation: 5,
                      backgroundColor: Colors.blue,
                      onPressed: () {
                        _cambiarTipoMapa();
                      }),
                  const SizedBox(height: 10,),
                  FloatingActionButton(
                      child: Icon(Icons.arrow_forward),
                      elevation: 5,
                      backgroundColor: Colors.blue,
                      onPressed: () {
                        _irACochabamba();
                      }),
                  const SizedBox(height: 10,),
                  FloatingActionButton(
                      child: Icon(Icons.arrow_back),
                      elevation: 5,
                      backgroundColor: Colors.blue,
                      onPressed: () {
                        _irALaPaz();
                      }),
                  const SizedBox(height: 10,),
                  FloatingActionButton(
                      child: const Icon(Icons.gps_fixed),
                      elevation: 5,
                      backgroundColor: Colors.blue,
                      onPressed: () {
                        obtenerLocalizacion();
                      }),
                ]
            ),
          ),

        ],
      ),
      persistentFooterButtons: [
        Center(
          child: Column(
            children: [
              Text("${(_currentPosition!.latitude != null)
                  ? _currentPosition!.latitude : "Latitud no disponible"},"
                  "${ (_currentPosition!.longitude != null)
                  ? _currentPosition!.longitude : "Longitud no disponible"}"),
              Text("${_currentAddress.isNotEmpty ? _currentAddress : "Dirección no disponible"}")
            ],
          ),
        )
      ],
    );
  }

  void _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
  }

  void _cambiarTipoMapa() {
    setState(() {
      _mapType = (_mapType == MapType.normal) ? MapType.hybrid : MapType.normal;
    });
  }

  Future<void> _irACochabamba() async {
    LatLng coord = LatLng(-17.394070, -66.157041);
    GoogleMapController control = await _controller.future;
    control.animateCamera(CameraUpdate.newLatLngZoom(coord, 18.0));
    setState(() {
      _markers.clear();
      _markers.add(
        Marker(
            markerId: MarkerId("cbba"),
            position: coord,
            infoWindow: const InfoWindow(
              title: "Cochabamba",
              snippet: "Plaza 14 de Septiembre"
            ),
            onTap: () {
              // accion click
            }
        )
      );
    });
  }

  Future<void> _irALaPaz() async {
    LatLng coord = LatLng(-16.495416, -68.133435);
    GoogleMapController control = await _controller.future;
    control.animateCamera(CameraUpdate.newLatLngZoom(coord, 18.0));
    setState(() {
      _markers.clear();
      _markers.add(
          Marker(
              markerId: MarkerId("lpz"),
              position: coord,
              infoWindow: const InfoWindow(
                  title: "La Paz",
                  snippet: "Plaza Murillo"
              ),
              onTap: () {
                // accion click
              }
          )
      );
    });
  }

  Future<void> obtenerLocalizacion() async {
    _currentPosition = await _determinarPosicion();
    print(_currentPosition!.latitude);
    GoogleMapController cont = await _controller.future;
    cont.animateCamera(
      CameraUpdate.newLatLngZoom(LatLng(
          _currentPosition!.latitude,
          _currentPosition!.longitude), 18.0)
    );

    setState(() {
      _markers.clear();
      _markers.add(
        Marker(
          markerId: MarkerId("marcador"),
          position: LatLng(_currentPosition!.latitude, _currentPosition!.longitude),
        )
      );
    });
    _getAddressFromLatLng();
  }

  Future<Position> _determinarPosicion() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if(!serviceEnabled) {
      return Future.error("Los servicios de ubicación estan deshabilitados.");
    }
    permission = await Geolocator.checkPermission();
    if(permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if(permission == LocationPermission.denied) {
        return Future.error("Los permisos de ubicacion fueron denegados");
      }
    }
    if(permission == LocationPermission.deniedForever) {
      return Future.error("Los permisos de ubicacion se negaron permanentemente, no podemos solicitar permisos.");
    }
    return await Geolocator.getCurrentPosition();
  }

  Future<void> _getAddressFromLatLng() async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(
        _currentPosition!.latitude, _currentPosition!.longitude
      );
      Placemark place = placemarks[0];
      setState(() {
        _currentAddress = "${place.street}, ${place.locality}, ${place.subLocality},"
            " ${place.postalCode}, ${place.country}";
      });
    } catch(err) {
      print(err);
    }
  }








}

