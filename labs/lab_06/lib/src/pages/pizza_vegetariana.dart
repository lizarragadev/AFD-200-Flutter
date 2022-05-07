import 'package:flutter/material.dart';
import 'package:lab_06/src/widgets/utils.dart';

class PizzaVegetariana extends StatelessWidget {
  const PizzaVegetariana({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrangeAccent,
        title: crearTitulo("Pizza Vegetariana"),
        actions: crearAcciones(context),
      ),
      body: Column(
        children: [
          crearBotones(context),
          crearContenido("images/vpizza.png", "Pizza Vegetariana exactamente como a ti te gusta")
        ],
      ),
    );
  }
}
