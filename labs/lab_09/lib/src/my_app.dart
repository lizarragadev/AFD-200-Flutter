import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lab_09/src/routes/routes.dart';

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: MyRoutes.generateRoute,
      initialRoute: getRoute(),
      debugShowCheckedModeBanner: false,
    );
  }

  static String getRoute() {
    User? usuario = FirebaseAuth.instance.currentUser;
    if(usuario != null) {
      return RoutePaths.homePage;
    } else {
      return RoutePaths.loginPage;
    }
  }
}