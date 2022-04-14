import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final opciones = ["Opcion 1", "Opcion 2", "Opcion 3", "Opcion 4", "Opcion 5"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: Text("Menú Inicio"),
      ),
      body: ListView(
        children: _crearItems(),
      ),
    );
  }

  List<Widget> _crearItems() {
    List<Widget> lista = [];
    opciones.forEach((element) {
      final tempWidget = ListTile(
        title: Text(element),
        subtitle: Text("Descrion del Item"),
        leading: Icon(Icons.ac_unit),
        trailing: Icon(Icons.arrow_forward_ios),
      );
      lista..add(tempWidget)
           ..add(Divider());
    });
    return lista;
  }
}
