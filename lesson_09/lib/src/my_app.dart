import 'package:flutter/material.dart';
import 'package:lesson_09/src/routes/routes.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      onGenerateRoute: MyRoutes.generateRoute,
      initialRoute: RoutePaths.loginPage,
      debugShowCheckedModeBanner: false,
    );
  }
}
