
import 'package:flutter/material.dart';

class PaginaIncrementador extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _PaginaIncrementadorState();
}

class _PaginaIncrementadorState extends State<PaginaIncrementador> {
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
            Text("Cantida de click:", style:  estiloTexto),
            SizedBox(height: 20.0),
            Text('$contador', style: estiloTexto)
          ],
        ),
      ),
      floatingActionButton: _crearBotones(),
    );
  }

  Widget _crearBotones() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        FloatingActionButton(onPressed: _resetear, child: Icon(Icons.reset_tv)),
        SizedBox(width: 130.0),
        FloatingActionButton(onPressed: _restar, child: Icon(Icons.remove)),
        SizedBox(width: 10.0),
        FloatingActionButton(onPressed: _adicionar, child: Icon(Icons.add))
      ],
    );
  }

  void _adicionar() => setState(() { contador++; });

  void _restar() => setState(() { contador--; });

  void _resetear() => setState(() { contador = 0; });

}
