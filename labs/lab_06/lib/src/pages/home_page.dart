import 'package:flutter/material.dart';
import 'package:lab_06/src/widgets/utils.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrangeAccent,
        title: crearTitulo("WOW Pizza"),
        actions: crearAcciones(context),
      ),
      body: Column(
        children: [
          crearBotones(context),
          crearContenido("images/meal.jpg", "Hola, Soy tu asistente de Pizzas, ¿Cómo te puedo ayudar?")
        ],
      ),
    );
  }
}
