import 'package:flutter/material.dart';
import 'package:lesson_10/src/routes/routes.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(

      onGenerateRoute: MyRoutes.generateRoute,
      initialRoute: RoutePaths.googleMaps,
      debugShowCheckedModeBanner: false,
    );
  }
}
