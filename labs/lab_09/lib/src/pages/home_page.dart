import 'package:flutter/material.dart';
import 'package:lab_09/src/pages/contacts_page.dart';
import 'package:lab_09/src/pages/profile_page.dart';
import 'package:lab_09/src/pages/notes_page.dart';
import 'package:lab_09/src/providers/auth_provider.dart';
import 'package:lab_09/src/routes/routes.dart';
import 'package:lab_09/src/utils/utils.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  late AuthProvider _providers;
  int selectedPage = 0;
  final pagesc = [
    ProfilePage(),
    NotesPage(),
    ContactsPage()
  ];

  @override
  void initState() {
    super.initState();
    _providers = AuthProvider(context: context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LAB 9'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              cerrarSesion();
            }
          )
        ],
        backgroundColor: const Color.fromRGBO(143, 148, 251, 1),
      ),
      body: pagesc[selectedPage],
      bottomNavigationBar: Container(
        margin: const EdgeInsets.only(right: 15, left: 15),
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
                icon: Icon(Icons.note_add),
                label: 'Notas',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.contacts),
                label: 'Contactos',
              ),
            ],
            currentIndex: selectedPage,
            type: BottomNavigationBarType.fixed,
            backgroundColor: const Color.fromRGBO(143, 148, 251, 1),
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

  cerrarSesion() async{
    await _providers.logOut();
    Navigator.pushReplacementNamed(context, RoutePaths.loginPage);
    mostrarMensaje(context, "Se cerro sesion", 2);
  }

}
