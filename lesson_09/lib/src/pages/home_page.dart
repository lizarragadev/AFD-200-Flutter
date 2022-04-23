import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lesson_09/src/pages/cloud_firestore_page.dart';
import 'package:lesson_09/src/pages/profile_page.dart';
import 'package:lesson_09/src/pages/realtime_database_page.dart';
import 'package:lesson_09/src/routes/routes.dart';
import 'package:lesson_09/src/utils/utils.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  int selectedPage = 0;
  final pagesc = [
    ProfilePage(),
    RealtimeDatabasePage(),
    CloudFirestorePage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('LESSON 9'),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              _auth.signOut();
              Navigator.pushReplacementNamed(context, RoutePaths.loginPage);
              mostrarMensaje(context, "Se cerro sesion", 2);},
          )
        ],
        backgroundColor: Color.fromRGBO(143, 148, 251, 1),
      ),
      body: pagesc[selectedPage],
      bottomNavigationBar: Container(
        margin: EdgeInsets.only(right: 15, left: 15),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(30),
              topLeft: Radius.circular(30)
          ),
          boxShadow: [
            BoxShadow(color: Colors.black38, spreadRadius: 5, blurRadius: 10),
          ],
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(30.0),
              topRight: Radius.circular(30.0)
          ),
          child: BottomNavigationBar(
            items: const[
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Perfil',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.star),
                label: 'Realtime',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person_pin),
                label: 'Firestore',
              ),
            ],
            currentIndex: selectedPage,
            type: BottomNavigationBarType.fixed,
            backgroundColor: Color.fromRGBO(143, 148, 251, 1),
            fixedColor: Colors.white,
            unselectedItemColor: Colors.black12,
            onTap: (index) {
              setState(() {
                selectedPage = index;
              });
            },
          ),
        ),
      ),
    );
  }
}
