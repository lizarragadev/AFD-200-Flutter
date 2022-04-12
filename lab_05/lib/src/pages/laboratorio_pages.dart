import 'package:flutter/material.dart';

class LaboratorioPages extends StatelessWidget {
  const LaboratorioPages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Android ATC Pizza Place"),
        backgroundColor: Colors.deepOrangeAccent,
      ),
      body: _crearCards(),
    );
  }

  Widget _crearCards() {
    return Column(
      children: [
        creaCard("images/pizza2.png", "Pizza Vegetariana"),
        creaCard("images/pizza1.png", "Pizza de Queso"),
        creaCard("images/fries.png", "Papas fritas"),
      ],
    );
  }

  Widget creaCard(String imagen, String nombre) {
    return Card(
      color: Colors.deepOrangeAccent,
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Row(
          children: [
            Image(image: AssetImage(imagen), width: 100.0,),
            SizedBox(width: 15.0,),
            Text(nombre,
              style: TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            )
          ],
        ),
      ),
    );
  }
}
