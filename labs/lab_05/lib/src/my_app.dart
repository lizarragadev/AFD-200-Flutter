import 'package:flutter/material.dart';
import 'package:lab_05/src/pages/laboratorio_pages.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LaboratorioPages(),
    );
  }
}
