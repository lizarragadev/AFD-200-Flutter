import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lesson_09/src/routes/routes.dart';
import 'package:lesson_09/src/utils/utils.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('HOME'),
          actions: [
            IconButton(
              icon: Icon(Icons.logout),
              onPressed: () {
                _auth.signOut();
                Navigator.pushReplacementNamed(context, RoutePaths.loginPage);
                mostrarMensaje(context, "Se cerró sesión", 2);
              },
            )
          ],
        ),
        body: Center(
          child: Text("Bienvenido: \n${_auth.currentUser?.email}", style: TextStyle(fontSize: 20),),
        )
    );;
  }
}
