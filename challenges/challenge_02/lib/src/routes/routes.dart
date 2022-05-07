
import 'package:challenge_02/src/pages/dos_page.dart';
import 'package:challenge_02/src/pages/home_page.dart';
import 'package:challenge_02/src/pages/uno_page.dart';
import 'package:flutter/material.dart';

Map<String, WidgetBuilder> _getApplicationRoutes() {
  return {
    '/': (context) => const HomePage(),
    '/unoPage': (context) => UnoPage(),
    '/dosPage': (context) => DosPage()
  };
}

final getApplicationRoutes = _getApplicationRoutes();