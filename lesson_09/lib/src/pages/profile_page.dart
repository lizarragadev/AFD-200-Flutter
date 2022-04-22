import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({Key? key}) : super(key: key);

  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Bienvenido: \n${_auth.currentUser?.email}",
        style: TextStyle(fontSize: 20), textAlign: TextAlign.center,),
    );
  }
}
