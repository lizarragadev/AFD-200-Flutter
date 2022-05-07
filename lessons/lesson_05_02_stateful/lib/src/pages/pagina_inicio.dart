
import 'package:flutter/material.dart';

class PaginaInicio extends StatelessWidget {
  final estiloTexto = TextStyle(fontSize: 25);
  int contador = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Mi primera App"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Cantidad de clicks:", style:  estiloTexto),
            Text('$contador', style: estiloTexto)
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          contador++;
          print("Click en FAB $contador");
        },
        child: Icon(Icons.add),
      ),
    );
  }

}