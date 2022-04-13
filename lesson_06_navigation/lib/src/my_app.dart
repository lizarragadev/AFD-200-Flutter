import 'package:flutter/material.dart';
import 'package:lesson_06_navigation/src/pages/dos_page.dart';
import 'package:lesson_06_navigation/src/pages/menu_page.dart';
import 'package:lesson_06_navigation/src/pages/tres_page.dart';
import 'package:lesson_06_navigation/src/pages/uno_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //home: UnoPage(),
      home: MenuPage(),
      routes: {
        '1': (context) => UnoPage(),
        '2': (context) => DosPage(),
        '3': (context) => TresPage(valor: "Ruta nombrada"),
      },
    );
  }
}
