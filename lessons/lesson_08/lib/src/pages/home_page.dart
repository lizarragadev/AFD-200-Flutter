import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final opciones = {
    "/textFields": "TextFields",
    "/checkRadio": "CheckBox & RadioButton",
    "/pickers": "Pickers & Dialog",
    "/sliderSwitch": "Slider & Switch",
    "/bottomSheet": "Bottom Sheets",
    "/expansionPanel": "Expansion Panel & SnackBar",
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Menu Lesson 8'),
        ),
        body: ListView(
          children: _crearItems(context),
        )
    );;
  }

  List<Widget> _crearItems(context) {
    List<Widget> lista = [];
    opciones.forEach((key, value) {
      final tempWidget = ListTile(
          title: Text(value),
          leading: Icon(Icons.android_sharp),
          trailing: Icon(Icons.arrow_forward_ios_sharp),
          onTap: () {
            Navigator.pushNamed(context, key);
          }
      );
      lista..add(tempWidget)
        ..add(Divider());
    });
    return lista;
  }

}
