import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  //final opciones2 = ["Opcion 1", "Opcion 2", "Opcion 3", "Opcion 4", "Opcion 5"];
  final opciones = {
    "/bottomNav": "Bottom Navigation Bar",
    "/tabs": "Tab Bars",
    "/drawers": "Drawers",
    "/listView": "ListView y ListTiles",
    "/dataTable": "Data Tables",
    "/selectableText": "Selectable Text",
    "/stack": "Stacks",
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: const Text("Menú Inicio"),
      ),
      body: ListView(
        children: _crearItems(context),
      ),
    );
  }

  List<Widget> _crearItems(context) {
    List<Widget> lista = [];
    opciones.forEach((key, value) {
      final tempWidget = ListTile(
        title: Text(value),
        leading: const Icon(Icons.android_sharp),
        trailing: const Icon(Icons.arrow_forward_ios),
        onTap: () {
          Navigator.pushNamed(context, key);
        },
      );
      lista..add(tempWidget)
        ..add(const Divider());
    });
    return lista;
  }
}
