import 'package:flutter/material.dart';
import 'package:lab_06/src/pages/facebook_page.dart';
import 'package:lab_06/src/pages/home_page.dart';
import 'package:lab_06/src/pages/papas_fritas.dart';
import 'package:lab_06/src/pages/pizza_queso.dart';
import 'package:lab_06/src/pages/pizza_vegetariana.dart';
import 'package:lab_06/src/pages/twitter_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      routes: {
        'vegetariana': ( context ) => PizzaVegetariana(),
        'queso': ( context ) => PizzaQueso(),
        'papas': ( context ) => PapasFritas(),
        'facebook': ( context ) => FacebookPage(),
        'twitter': ( context ) => TwitterPage()
      },
    );
  }
}
