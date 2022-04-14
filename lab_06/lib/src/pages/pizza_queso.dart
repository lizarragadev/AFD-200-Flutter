import 'package:flutter/material.dart';
import 'package:lab_06/src/pages/utils.dart';

class PizzaQueso extends StatelessWidget {
  const PizzaQueso({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrangeAccent,
        title: crearTitulo("Pizza de Queso"),
        actions: crearAcciones(context),
      ),
      body: Column(
        children: [
          crearBotones(context),
          crearContenido("images/cheesepizza.png", "Esta es una Pizza de Queso especialmente para ti.!")
        ],
      ),
    );
  }
}
