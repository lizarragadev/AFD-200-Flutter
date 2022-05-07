import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'dart:async';

class AuthProvider {
  BuildContext context;
  AuthProvider({required this.context});

  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<dynamic> loginUsuario(correo, contrasenia) async {
    try {
      final loginUser = await _auth.signInWithEmailAndPassword(email: correo, password: contrasenia);
      return loginUser;
    } on FirebaseAuthException catch(err) {
      return err.code;
    }
  }

  Future<dynamic> registrarUsuario(correo, contrasenia) async {
    try {
      final newUser = await _auth.createUserWithEmailAndPassword(email: correo, password: contrasenia);
      return newUser;
    } on FirebaseAuthException catch(err) {
      return err.code;
    }
  }

  User? getUser() {
    return _auth.currentUser;
  }

  Future<void> logOut() async {
    await _auth.signOut();
  }

}
