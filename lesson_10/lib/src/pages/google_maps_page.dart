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

  final Completer<GoogleMapController> _controller = Completer();
  MapType _mapType = MapType.normal;

  final CameraPosition _posicionInicial = const CameraPosition(
      target: LatLng(-16.529824, -68.101117), zoom: 16.0);
  final Set<Marker> _markers = {};

  Position? _currentPosition;
  String _currentAddress = "No disponible";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Google Maps'),
      ),
      body: Stack(
        children: [
          GoogleMap(
            onMapCreated: _onMapCreated,
            initialCameraPosition: _posicionInicial,
            mapType: _mapType,
            myLocationEnabled: true,
            myLocationButtonEnabled: true,
            markers: _markers,
            rotateGesturesEnabled: true,
            scrollGesturesEnabled: true,
            tiltGesturesEnabled: true,
            zoomGesturesEnabled: true,
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
              Text("${(_currentPosition?.latitude != null) ? _currentPosition
                  ?.latitude : "Latitud no dispoinible"}, ${(_currentPosition
                  ?.longitude != null)
                  ? _currentPosition?.longitude
                  : "Longitud no disponible"}"),
              Text((_currentAddress.isNotEmpty)
                  ? _currentAddress
                  : "Dirección no disponible"),
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
      _mapType =
      _mapType == MapType.normal ? MapType.satellite : MapType.normal;
    });
  }

  Future<void> _irACochabamba() async {
    double lat = -17.393799;
    double long = -66.157104;
    GoogleMapController controller = await _controller.future;
    controller.animateCamera(
        CameraUpdate.newLatLngZoom(LatLng(lat, long), 18.0));
    setState(() {
      _markers.clear();
      _markers.add(
        Marker(
            markerId: const MarkerId('cbba'),
            position: LatLng(lat, long),
            infoWindow: const InfoWindow(
                title: 'Cochabamba', snippet: 'Plaza 14 de Septiembre')
        ),
      );
    });
  }

  Future<void> _irALaPaz() async {
    double lat = -16.495825;
    double long = -68.133454;
    GoogleMapController controller = await _controller.future;
    controller.animateCamera(
        CameraUpdate.newLatLngZoom(LatLng(lat, long), 18.0));
    setState(() {
      _markers.clear();
      _markers.add(
        Marker(
            markerId: const MarkerId('lpz'),
            position: LatLng(lat, long),
            infoWindow: const InfoWindow(
                title: 'La Paz', snippet: 'Plaza Murillo')
        ),
      );
    });
  }

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Los servicios de ubicación están deshabilitados.');
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Los permisos de ubicación están denegados');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Los permisos de ubicación se niegan permanentemente, no podemos solicitar permisos.');
    }
    return await Geolocator.getCurrentPosition();
  }

  Future<void> obtenerLocalizacion() async {
    _currentPosition = await _determinePosition();
    GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newLatLngZoom(
        LatLng(_currentPosition!.latitude, _currentPosition!.longitude), 18.0));
    setState(() {
      _markers.clear();
      _markers.add(
        Marker(
            markerId: const MarkerId('posicion'),
            position: LatLng(
                _currentPosition!.latitude, _currentPosition!.longitude),
            infoWindow: const InfoWindow(
                title: 'Posición actual', snippet: 'Posición actual')
        ),
      );
    });
    _getAddressFromLatLng();
  }

  void _getAddressFromLatLng() async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(
          _currentPosition!.latitude,
          _currentPosition!.longitude
      );
      Placemark place = placemarks[0];
      setState(() {
        _currentAddress =
        "${place.street}, ${place.locality}, ${place.subLocality}, ${place
            .postalCode}, ${place.country}";
      });
    } catch (e) {
      print(e);
    }
  }

}

