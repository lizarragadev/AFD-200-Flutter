import 'package:flutter/material.dart';
import 'package:lesson_08/src/routes/routes.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: getApplicationRoutes(),
      initialRoute: '/',
      debugShowCheckedModeBanner: false,
    );
  }
}
