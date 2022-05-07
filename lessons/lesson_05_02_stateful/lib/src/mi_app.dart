
import 'package:flutter/material.dart';
import 'package:lesson_05/src/pages/pagina_incrementador.dart';
import 'package:lesson_05/src/pages/pagina_inicio.dart';

class MiApp extends StatelessWidget {
  @override
  Widget build( context ) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Center(
        //child: PaginaInicio(),
        child: PaginaIncrementador(),
      ),
    );
  }
}