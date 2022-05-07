import 'package:flutter/material.dart';
import 'package:lesson_06_animate/src/pages/inicio_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: InicioPage(),
    );
  }
}
