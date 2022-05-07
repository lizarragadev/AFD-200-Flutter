import 'package:flutter/material.dart';
import 'package:lab_extra/src/routes/routes.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      onGenerateRoute: Routes.generateRoute,
      initialRoute: RoutePaths.homePage,
      debugShowCheckedModeBanner: false,
    );
  }
}
