
import 'package:flutter/material.dart';
import 'package:lab_08/src/pages/home_page.dart';
import 'package:lab_08/src/pages/rooms_page.dart';

Map<String, WidgetBuilder> _getApplicationRoutes() {
  return {
    '/': (context) => const HomePage(),
    '/roomPage': (context) => RoomsPage()
  };
}

final getApplicationRoutes = _getApplicationRoutes();