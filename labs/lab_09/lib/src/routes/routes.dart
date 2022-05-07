
import 'package:flutter/material.dart';
import 'package:lab_09/src/pages/add_contact_page.dart';
import 'package:lab_09/src/pages/add_note_page.dart';
import 'package:lab_09/src/pages/error_page.dart';
import 'package:lab_09/src/pages/home_page.dart';
import 'package:lab_09/src/pages/login_page.dart';
import 'package:lab_09/src/pages/register_page.dart';

class RoutePaths {
  static const loginPage = "login";
  static const registerPage = "register";
  static const homePage = "home";
  static const addNotePage = "addNote";
  static const addContactPage = "addContact";
}

class MyRoutes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch(settings.name) {
      case RoutePaths.loginPage: return MaterialPageRoute(builder: (context) => LoginPage());
      case RoutePaths.registerPage: return MaterialPageRoute(builder: (context) => RegisterPage());
      case RoutePaths.homePage: return MaterialPageRoute(builder: (context) => HomePage());
      case RoutePaths.addNotePage: return MaterialPageRoute(builder: (context) => AddNotePage());
      case RoutePaths.addContactPage: return MaterialPageRoute(builder: (context) => AddContactPage());
      default: return MaterialPageRoute(builder: (context) => ErrorPage());
    }
  }
}