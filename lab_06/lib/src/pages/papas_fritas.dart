import 'package:flutter/material.dart';
import 'package:lab_06/src/pages/utils.dart';

class PapasFritas extends StatelessWidget {
  const PapasFritas({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrangeAccent,
        title: crearTitulo("Papas Fritas"),
        actions: crearAcciones(context),
      ),
      body: Column(
        children: [
          crearBotones(context),
          crearContenido("images/fpizza.png", "Papas Fritas crocantes y deliciosas")
        ],
      ),
    );
  }
}
