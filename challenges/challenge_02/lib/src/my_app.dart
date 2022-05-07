import 'package:challenge_02/src/routes/routes.dart';
import 'package:flutter/material.dart';

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
