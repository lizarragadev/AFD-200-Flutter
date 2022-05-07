import 'package:flutter/material.dart';

class LaboratorioPages extends StatelessWidget {
  const LaboratorioPages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Android ATC Pizza Place"),
        backgroundColor: Colors.deepOrangeAccent,
      ),
      body: _crearCards(),
    );
  }

  Widget _crearCards() {
    return ListView(
      padding: EdgeInsets.all(5),
      children: [
        creaCard("images/pizza2.png", "Pizza Vegetariana"),
        creaCard("images/pizza1.png", "Pizza de Queso"),
        creaCard("images/fries.png", "Papas fritas"),
        creaCard("images/pizza2.png", "Pizza Vegetariana"),
        creaCard("images/pizza1.png", "Pizza de Queso"),
        creaCard("images/fries.png", "Papas fritas"),
        creaCard("images/pizza2.png", "Pizza Vegetariana"),
        creaCard("images/pizza1.png", "Pizza de Queso"),
        creaCard("images/fries.png", "Papas fritas"),
        creaCard("images/pizza2.png", "Pizza Vegetariana"),
        creaCard("images/pizza1.png", "Pizza de Queso"),
        creaCard("images/fries.png", "Papas fritas"),
      ],
    );
  }

  Widget creaCard(String imagen, String nombre) {
    return Card(
        color: Colors.deepOrangeAccent,
        child: Container(
          padding: const EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image(image: AssetImage(imagen), width: 100.0,),
              const SizedBox(width: 15.0,),
              Flexible(
                  child: Text(nombre,
                    style: const TextStyle(
                        fontSize: 35.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  )
              )
            ],
          ),
        ),
      );
  }
}
