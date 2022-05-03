import 'package:flutter/material.dart';
import 'package:lab_extra/src/models/pelicula_model.dart';
import 'package:lab_extra/src/pages/detail_page.dart';
import 'package:lab_extra/src/pages/home_page.dart';

class RoutePaths {
  static const homePage = "homePage";
  static const detailPage = "detailPage";
}

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch(settings.name) {
      case RoutePaths.homePage: return MaterialPageRoute(builder: (context) => HomePage());
      case RoutePaths.detailPage: return MaterialPageRoute(builder: (context) => DetailPage(settings.arguments as Pelicula));
      default: return MaterialPageRoute(builder: (context) => Text("Ruta erronea"));
    }
  }
}