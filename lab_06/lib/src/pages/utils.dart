import 'package:flutter/material.dart';

Widget crearContenido(imagen, descripcion) {
  return Center(
    child: Padding(
      padding: EdgeInsets.all(15.0),
      child: Column(
        children: [
          Image(
            image: AssetImage(imagen),
            width: 400.0,
          ),
          SizedBox(height: 20.0,),
          Text(
            descripcion,
            style: TextStyle(fontSize: 30.0),
            textAlign: TextAlign.center,
          )
        ],
      ),
    ),
  );
}

Widget crearBotones(context) {
  return ButtonBar(
    children: [
      botonIndividual("Pizza Vegetariana", context, "vegetariana"),
      botonIndividual("Pizza de Queso", context, "queso"),
      botonIndividual("Papas Fritas", context, "papas"),
    ],
  );
}

Widget botonIndividual(nombre, context, nombreRuta) {
  return OutlinedButton(
    onPressed: () {
      Navigator.pushNamed(context, nombreRuta);
    },
    child: Text(
      nombre,
      style: TextStyle(
          fontSize: 11.0,
          color: Colors.deepOrange
      ),
    ),
    style: OutlinedButton.styleFrom(
        shape: StadiumBorder(),
        side: BorderSide(
            width: 2.0,
            color: Colors.deepOrange
        )
    ),
  );
}

List<Widget> crearAcciones(context) {
  return [
    IconButton(
        onPressed: () {
          Navigator.pushNamed(context, 'twitter');
        },
        icon: Icon(Icons.favorite)
    ),
    IconButton(
        onPressed: () {
          Navigator.pushNamed(context, 'facebook');
        },
        icon: Icon(Icons.facebook)
    ),
  ];
}

Widget crearTitulo(titulo) {
  return Text(
    titulo,
    style: TextStyle(fontWeight: FontWeight.bold),
  );
}