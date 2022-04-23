
import 'package:flutter/material.dart';
import 'package:lesson_09/src/pages/add_note_page.dart';
import 'package:lesson_09/src/pages/error_page.dart';
import 'package:lesson_09/src/pages/home_page.dart';
import 'package:lesson_09/src/pages/login_page.dart';
import 'package:lesson_09/src/pages/register_page.dart';

class RoutePaths {
  static const loginPage = "login";
  static const registerPage = "register";
  static const homePage = "home";
  static const addNotePage = "addNote";
}

class MyRoutes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch(settings.name) {
      case RoutePaths.loginPage: return MaterialPageRoute(builder: (context) => LoginPage());
      case RoutePaths.registerPage: return MaterialPageRoute(builder: (context) => RegisterPage());
      case RoutePaths.homePage: return MaterialPageRoute(builder: (context) => HomePage());
      case RoutePaths.addNotePage: return MaterialPageRoute(builder: (context) => AddNotePage());
      default: return MaterialPageRoute(builder: (context) => ErrorPage());
    }
  }
}