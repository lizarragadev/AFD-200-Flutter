import 'package:flutter/material.dart';
import 'package:lesson_10/src/pages/error_page.dart';
import 'package:lesson_10/src/pages/google_maps_page.dart';

class RoutePaths {
  static const googleMaps = "googleMaps";
  static const errorPage = "errorPage";
}

class MyRoutes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch(settings.name) {
      case RoutePaths.googleMaps: return MaterialPageRoute(builder: (context) => const GoogleMapsPage());
      default: return MaterialPageRoute(builder: (context) => const ErrorPage());
    }
  }
}
