import 'package:flutter/material.dart';
import 'package:lab_08/src/routes/routes.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: getApplicationRoutes,
      debugShowCheckedModeBanner: false,
    );
  }
}
