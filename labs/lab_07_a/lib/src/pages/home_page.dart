import 'package:flutter/material.dart';
import 'package:lab_07/src/pages/cuatro_page.dart';
import 'package:lab_07/src/pages/dos_page.dart';
import 'package:lab_07/src/pages/tres_page.dart';
import 'package:lab_07/src/pages/uno_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedPage = 0;

  final _pages = [
    const UnoPage(),
    const DosPage(),
    const TresPage(),
    const CuatroPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lab 07 - A'),
      ),
      body: _pages[_selectedPage],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.blue,
        selectedItemColor: Colors.white,
        selectedFontSize: 19.0,
        unselectedFontSize: 14.0,
        iconSize: 30.0,
        currentIndex: _selectedPage,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Inicio"
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.access_alarm),
              label: "Alarmas"
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.business),
              label: "Negocios"
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.school),
              label: "Escuela"
          ),
        ],
        onTap: (index) {
          setState(() {
            _selectedPage = index;
          });
        },
      ),
    );
  }
}
