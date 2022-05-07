import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lab_09/src/providers/auth_provider.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({Key? key}) : super(key: key);

  late AuthProvider _provider;
  late User? _user;

  @override
  Widget build(BuildContext context) {
    _provider = AuthProvider(context: context);
    _user = _provider.getUser();

    return Center(
      child: Text("Bienvenido: \n${_user?.email}",
        style: const TextStyle(fontSize: 20), textAlign: TextAlign.center,),
    );
  }
}
